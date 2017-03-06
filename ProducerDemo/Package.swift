import PackageDescription

let package = Package(
    name: "ProducerDemo",
    dependencies: [.Package(url:"https://github.com/PerfectlySoft/Perfect-Kafka.git", majorVersion: 1)]
)
