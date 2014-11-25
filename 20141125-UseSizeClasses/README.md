# 学习如何使用Size Classes

*Size Classes*

1. 概念
	IOS8中新增了SizeClasses特性，它是对当前所有IOS设备尺寸的一个抽象。
	想想现在的IOS设备：iphone4-5-6-6plus, iPad, iPad mini, iWatch; 没有它，单纯用Autolayout针对某种设备部件，也挺累的。

2. 用法
	屏幕的宽和高分别分成三种情况：（Compact, Regular, Any), 也即紧凑、正常和任意。这样的宽和高三三一整合，一共9种情况。针对每一种情况，如果需要的话，我们可以单独在storyboard或xib中设置uiview的自动布局约束，甚至某一个button是否显示都是能轻松实现。


