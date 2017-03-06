#if os(Linux)
import SwiftGlibc
#else
import Darwin
#endif
import PerfectKafka

let args = CommandLine.arguments
guard args.count > 3 else {
  print("usage: \(args[0]) [Topic Name] [Host:Port] [Time to Wait]")
  exit(0)
}//end guard

let topic = args[1]
let hosts = args[2]
let seconds = Int(args[3]) ?? 3

do {
  let consumer = try Consumer(topic)
  let brokers = consumer.connect(brokers: hosts)
  guard brokers > 0 else {
    print("Kafka connection failed")
    exit(0)
  }//end guard
  var total = 0
  consumer.OnArrival = { m in
    if total % 10000 == 0 {
      print("message : #\(m.offset) \(m.text)")
    }//end if
    total += 1
  }//end consumer

  let info = try consumer.brokerInfo()
  guard info.topics.count > 0 else {
    print("no topics found")
    exit(0)
  }//end guard
  guard info.topics[0].name == topic else {
    print("unexpected topic: \(info.topics[0].name)")
    exit(0)
  }//end guard
  let partitions = info.topics[0].partitions
  let then = time(nil)
  var now = then
  for i in 0 ... partitions.count - 1 {
    try consumer.start(partition: Int32(partitions[i].id))
  }//next
  repeat {
    now = time(nil)
    for i in 0 ... partitions.count - 1 {
      let _ = try consumer.poll(partition: Int32(partitions[i].id))
    }//next
  } while (now - then) < seconds
  for i in 0 ... partitions.count - 1 {
    try consumer.stop(Int32(partitions[i].id))
  }//next
  print("total received: \(total)")
}catch(let err) {
  print("Kafka Producer Failed: \(err)")
}
