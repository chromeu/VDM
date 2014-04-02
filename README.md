VDM
===
防止了哪下崩溃：
1、UIControl依赖的target对象被释放，UIControl继续响应设置给target的selector函数导致的crash

2、UITableView依赖的delegate、datasource对象被释放后，UITableView继续响应delegate和datasource函数导致的crash

3、UIScrollView依赖的delegate的对象被释放后，UIScrollView继续响应delegate函数导致的crash

4、UIPickView依赖的delegate、datasource对象被释放后，UITableView继续响应delegate和datasource函数导致的crash

5、UIGestureRecognizer依赖的target对象被释放后，UIGestureRecognizer继续响应设置给target的selector函数导致的cras
h
6、NSNotificationCenter向已经被释放的对象发送消息导致的crash

7、KVO的观察者observer被释放后value变化导致的crash

8、已释放对象调用延迟操作导致的crash

9、NSTimer的target对象被释放后，定时任务执行导致的crash

10、添加KVO重复添加观察者或重复移除观察者（KVO注册观察者与移除观察者不匹配）导致的crash
 
实现的大致原理：

1、创建dependencyManager单例管理依赖工具

2、category系统的有依赖属性的对象，如：UIControl、UIScrollView、UITableView、UIPickerView、UIGestureRecognizer，NSTimer
在这些对象创建依赖时，将依赖关系以key-value的形式保存到我们的dependencyManager的单例中去

3、category IOS中被依赖的对象UIVIew、UIViewController，当被依赖对象释放时，dependencyManager讲与之关联的依赖控件或手势、通知移除

示例工程使用说明：

1、在程序启动时调用

[[VSDependencyManager shareInstance] start]
 
示例crash点：

scrol下移除customview后，button点击、scrollview滚动、tap页面空白处

table下移除customview后，tableview滚动、点击、点击noti按钮发送通知

picker下移除customview后，pickerview滚动、点击、点击kvo改变value值，多次移除kvo的观察者

customview开启延时函数，并强制释放后，延时函数执行

customview开启定时任务，并强制释放后，定时任务执行

 
2、用户加入自己操作防止crash
VDMTest-Prefix.pch文件下
加入
#define USER_DEPENDENCY_SELF @"USER_DEPENDENCY_SELF"

注释该行即可撤销用户自己操作
 
3、当程序不使用dependency管理工具，用户自己也不进行依赖解除，crash点都会崩溃
当程序使用dependency管理工作或者用户自行解除依赖，以上crash点均不会crash
所以用户在自行处理的情况下依然可以使用dependency管理工作，操作不会有任何影响


其他工程嵌入：（dependency工具包支持arc和非arc模式，不需要工程配置）

将VDM文件夹直接拖到新的工程中，复制并加入工程

引入头文件

#import "VSDependencyCommon.h"

到APPDelegate.m文件 

程序启动时，启动dependency单例

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    [[VSDependencyManager shareInstance] start];
    return YES;;
}
