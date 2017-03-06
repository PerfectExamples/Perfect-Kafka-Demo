import PackageDescription

let package = Package(
    name: "ConsumerDemo",
    dependencies: [.Package(url:"https://github.com/PerfectlySoft/Perfect-Kafka.git", majorVersion: 1)]
)
