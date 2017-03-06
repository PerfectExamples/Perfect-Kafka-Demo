cd ProducerDemo
swift build
cd ../ConsumerDemo
swift build
cd ..
ConsumerDemo/.build/debug/ConsumerDemo testing nut.krb5.ca:9092 10 &
ProducerDemo/.build/debug/ProducerDemo testing nut.krb5.ca:9092 10 10
