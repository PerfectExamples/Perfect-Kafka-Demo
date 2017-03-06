#if os(Linux)
import SwiftGlibc
#else
import Darwin
#endif
import PerfectKafka

let args = CommandLine.arguments
guard args.count > 4 else {
  print("usage: \(args[0]) [Topic Name] [Host:Port] [Pulse Per Message] [Seconds To Run]")
  exit(0)
}//end guard

let topic = args[1]
let hosts = args[2]
let pulse = UInt(args[3]) ?? 100
let seconds = Int(args[4]) ?? 360

do {
  let producer = try Producer(topic)
  let brokers = producer.connect(brokers: hosts)
  guard brokers > 0 else {
    print("Kafka connection failed")
    exit(0)
  }//end guard
  let then = time(nil)
  var now = then
  var tosend = 0
  var sent = 0
  producer.OnSent = { _ in sent += 1 }
  repeat {
    now = time(nil)
    var messages = [(String, String?)]()
      for i in 1 ... 1000 {
        messages.append(("send message 批量编码 #\(i) -> \(now)", nil))
      }//next
      let tickets =  try producer.send(messages: messages)
      tosend += tickets.count
    producer.flush(pulse)
  } while (now - then) < seconds
  producer.flush(1000)
  print("to send / sent : \(tosend)\t\(sent)")
}catch(let err) {
  print("Kafka Producer Failed: \(err)")
}
