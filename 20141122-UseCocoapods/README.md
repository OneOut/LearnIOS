#Use cocoapods

1. 正常的创建一个ios项目
2. 打开命令行，cd命令切换到项目的目录
3. pod init
4. vim Podfile
5. 添加代码
 
```md 
platform :ios, "7.0"
pod 'AFNetworking', '~> 2.1.0'
```

6. pod install --verbose --no-repo-update
7. 打开刚才的项目目录，打开.xcworkspace，发现多了一个pod项目，现在在自己的项目里面就可以引入AFNetworking，进行使用了