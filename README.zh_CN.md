# Perfect-Kafka-Demo [English](README.md)

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="https://gitter.im/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_2_Git.jpg" alt="Chat on Gitter" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat" alt="Swift 3.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="https://gitter.im/PerfectlySoft/Perfect?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge" target="_blank">
        <img src="https://img.shields.io/badge/Gitter-Join%20Chat-brightgreen.svg" alt="Join the chat at https://gitter.im/PerfectlySoft/Perfect">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>


该项目实现了 librdkafka 的 Swift类函数库

该软件使用SPM进行编译和测试，本软件也是[Perfect](https://github.com/PerfectlySoft/Perfect)项目的一部分，但也可以独立使用。

请确保您已经安装并激活了最新版本的 Swift 3.0 tool chain 工具链。

## MacOS X 安装指南

在使用本函数库之前，请正确安装 librdkafka：

```
$ brew install librdkafka
```

另外注意可能需要在编译之前设定pkg-config路径环境变量：

```
$ export PKG_CONFIG_PATH="/usr/local/lib/pkgconfig"
```

## Linux 安装指南

在使用本函数库之前，请正确安装 librdkafka-dev：

```
$ sudo apt-get install librdkafka-dev
```

## Git Clone

请使用下列命令下载项目：

```
$ git clone https://github.com/PerfectExamples/Perfect-Kafka-Demo.git
```

## 设置卡夫卡服务器

请在运行本项目之前正确设置卡夫卡服务器（主要是安全性设置），并允许程序新建一个主题，如“testing”

## 运行演示

项目中有一个 `run.sh` 脚本，内容如下：

```
# 编译消息生产者
cd ProducerDemo
swift build
# 编译消息消费者
cd ../ConsumerDemo
swift build
cd ..
# 使用 nut.krb5.ca:9092 作为消息服务器（掮客），并测试10秒钟
ConsumerDemo/.build/debug/ConsumerDemo testing nut.krb5.ca:9092 10 &
ProducerDemo/.build/debug/ProducerDemo testing nut.krb5.ca:9092 10 10
```

应该能够看到大量试验消息在收发。

### 问题报告、内容贡献和客户支持

我们目前正在过渡到使用JIRA来处理所有源代码资源合并申请、修复漏洞以及其它有关问题。因此，GitHub 的“issues”问题报告功能已经被禁用了。

如果您发现了问题，或者希望为改进本文提供意见和建议，[请在这里指出](http://jira.perfect.org:8080/servicedesk/customer/portal/1).

在您开始之前，请参阅[目前待解决的问题清单](http://jira.perfect.org:8080/projects/ISS/issues).


## 更多信息
关于本项目更多内容，请参考[perfect.org](http://perfect.org).
