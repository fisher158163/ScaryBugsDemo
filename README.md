# ScaryBugsDemo
一个Mac端app Demo

# CocoaPods版本升级

**1.首先我们可以查看下当前的版本号命令如下:**


```
// 可用 "pod --version" 命令查看版本，目前最新版本1.3.1
liyuMacBook-Pro:~ Jerry.Yao$ pod --version
1.2.0  // 本机安装的版本

```

**2.在升级之前我们需要了解当前安装的Ruby源地址：**

```
// 使用命令查看当前使用的是淘宝的源: "gem source -l" 
liyuMacBook-Pro:~ Jerry.Yao$ gem source -l
*** CURRENT SOURCES ***
https://ruby.taobao.org/

```

**3.移除淘宝的Ruby源，添加一个新的源（注意：目前淘宝的源已经不能用了）**

```
// 移除旧的源 命令: "gem sources --remove"
liyuMacBook-Pro:~ Jerry.Yao$ gem sources --remove https://ruby.taobao.org/
// 添加新的源 命令: "gem sources -a https://gems.ruby-china.org/"
liyuMacBook-Pro:~ Jerry.Yao$ gem sources -a https://gems.ruby-china.org/

```

**4.查看新的源是否添加成功，使用的命令和步骤2一样**

```
// 新的源已经成功添加
liyuMacBook-Pro:~ Jerry.Yao$ gem source -l
*** CURRENT SOURCES ***
https://gems.ruby-china.org/

```

**5.开始安装，输入如下命令：**

```
// 输入命令和电脑开机密码 "sudo gem install cocoapods" 
liyuMacBook-Pro:~ Jerry.Yao$ sudo gem install cocoapods
Password:
Fetching: cocoapods-core-1.3.1.gem (100%)
Successfully installed cocoapods-core-1.3.1
Fetching: claide-1.0.2.gem (100%)
Successfully installed claide-1.0.2
Fetching: cocoapods-trunk-1.2.0.gem (100%)
Successfully installed cocoapods-trunk-1.2.0
Fetching: xcodeproj-1.5.1.gem (100%)
ERROR:  While executing gem ... (Errno::EPERM)
Operation not permitted - /usr/bin/xcodeproj

```

**在这一步有可能会报错”Operation not permitted - /usr/bin/xcodeproj”，解决办法如下：**

```
// 输入命令："sudo gem install -n /usr/local/bin cocoapods"
liyuMacBook-Pro:~ Jerry.Yao$ sudo gem install -n /usr/local/bin cocoapods
Successfully installed xcodeproj-1.5.1
Fetching: ruby-macho-1.1.0.gem (100%)
Successfully installed ruby-macho-1.1.0
Fetching: cocoapods-1.3.1.gem (100%)
Successfully installed cocoapods-1.3.1
Parsing documentation for xcodeproj-1.5.1
Installing ri documentation for xcodeproj-1.5.1
Parsing documentation for ruby-macho-1.1.0
Installing ri documentation for ruby-macho-1.1.0
Parsing documentation for cocoapods-1.3.1
Installing ri documentation for cocoapods-1.3.1
3 gems installed // 安装成功

```

**还有有可能会报错：**

```
ERROR:  While executing gem ... (TypeError)
no implicit conversion of nil into String
// 解决办法是执行如下命令更新gem
sudo gem update --system

```

**6.再次查看下CocoaPods的版本，已经成功升级咯！**

```
liyuMacBook-Pro:~ Jerry.Yao$ pod --version
1.3.1

```