---
title: LoveeApp 总结
tags: [swift]
categories: 项目总结
---

1. 重置返回按钮；demo隐藏文案

   ~~~swift
   //在父controller上设置
   let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
    self.navigationItem.backBarButtonItem = item;
   ~~~

2. UIImageView的contentMode属性

   ~~~swift
      public enum ContentMode : Int {
           case scaleToFill	// 将图片填满整个view；会改变图片比例
           case scaleAspectFit // 图片按比例缩放以适应view的高宽；有可能填充不满
   
           case scaleAspectFill // 图片按比例缩放填满view；图片有可能超出view；可以使用clipsToBounds截除超出的部分；其余属性不改变图片的尺寸
   
           case redraw // redraw on bounds change (calls -setNeedsDisplay)
   
           case center // contents remain same size. positioned adjusted.
   
           case top
   
           case bottom
   
           case left
   
           case right
   
           case topLeft
   
           case topRight
   
           case bottomLeft
   
           case bottomRight
       }
   ~~~

3. 使用`UITabBarController`和`UINavigationController`实现app的标签栏和导航栏；定义一个controller继承自`UITableBarController`

   ~~~swift
       //MARK:初始化TabbarItem
       private func initTabBarItem( controller:UIViewController,title:String,normalImage:String,selctedImg:String){
           let tabBarItem = UITabBarItem(title:title,image:UIImage(named:normalImage)?.withRenderingMode(.alwaysOriginal),selectedImage:UIImage(named:selctedImg)?.withRenderingMode(.alwaysOriginal))
           tabBarItem.imageInsets=UIEdgeInsets.init(top: 6, left: 0, bottom: -6, right: 0)
           controller.tabBarItem=tabBarItem
       }
       
       
       ///MARK: 添加子控制器
       private func addChildViewControllers() {
           //实例化对应的viewController
           let chatMainViewController = ChatMainViewController()//推荐，关注
           let messageViewController = MessageViewController()//消息，通知页面
           let mineViewController = MineController()//我的页面
           let  chatMainTabViewControllerTabController = UINavigationController(rootViewController: chatMainViewController)
           let  messageTabViewControllerTabController = UINavigationController(rootViewController: messageViewController)
           let  mineTabViewControllerTabController = UINavigationController(rootViewController: mineViewController)
           //设置选中页面
           let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
           chatMainTabViewControllerTabController.navigationItem.backBarButtonItem = item
           self.selectedNavigation=chatMainTabViewControllerTabController
           self.viewControllers=[
                   chatMainTabViewControllerTabController,messageTabViewControllerTabController,mineTabViewControllerTabController
           ]
           
           // 设置tabBarController底部对应的按钮渲染
           let tabBarImages = ["ic_nav_chating_normall","ic_nav_message_nor","ic_nav_me_nor"]
           let tabBarImageClick = ["ic_nav_chating_pre","ic_nav_message_pre","ic_nav_me_pre"]
           
           initTabBarItem(controller: self.viewControllers![0], title: "", normalImage:tabBarImages[0], selctedImg: tabBarImageClick[0])
           initTabBarItem(controller: self.viewControllers![1], title: "", normalImage:tabBarImages[1], selctedImg: tabBarImageClick[1])
           initTabBarItem(controller: self.viewControllers![2], title: "", normalImage:tabBarImages[2], selctedImg: tabBarImageClick[2])        
           self.tabBar.backgroundColor=COLOR_WHITE
           self.tabBar.isTranslucent=false
       }
   ~~~

4. 将状态栏中的颜色设置为白色；

   1. 使用代码更改页面状态栏颜色

   ~~~swift
   UIApplication.shared.statusBarStyle = .lightContent
   ~~~

   2. 更改info.plist文件设置
      * 首先在info.plist文件中将添加一个View controller-based status bar appearance的属性并且设置成NO.
      * 然后进入General -> Deployment Info 将Status Bar Style设置成Light即可。

5. 使用navigationController进入页面设置消失与显示要遵循以下规则

   1. 使用`setNavigationBarHidden`方法；不要使用`isHidden`属性
   2. 页面内设置隐藏的在`viewWillAppear`方法里；在`viewWillDisapper`恢复成显示

#### ios-swift-UserDefaults来进行本地数据存储

1. 对原生数据类型的储存和读取

   ~~~swift
   let userDefault = UserDefaults.standard
   
   //Any
   userDefault.set("hangge.com", forKey: "Object")
   let objectValue:Any? = userDefault.object(forKey: "Object")
   
   //Int类型
   userDefault.set(12345, forKey: "Int")
   let intValue = userDefault.integer(forKey: "Int")
   
   //Float类型
   userDefault.set(3.2, forKey: "Float")
   let floatValue = userDefault.float(forKey: "Float")
   
   //Double类型
   userDefault.set(5.2240, forKey: "Double")
   let doubleValue = userDefault.double(forKey: "Double")
   
   //Bool类型
   userDefault.set(true, forKey: "Bool")
   let boolValue = userDefault.bool(forKey: "Bool")
   
   //URL类型
   userDefault.set(URL(string:"http://hangge.com")!, forKey: "URL")
   let urlValue = userDefault.url(forKey: "URL")
   
   //String类型
   userDefault.set("hangge.com", forKey: "String")
   let stringValue = userDefault.string(forKey: "String")
   
   //NSNumber类型
   var number = NSNumber(value:22)
   userDefault.set(number, forKey: "NSNumber")
   number = userDefault.object(forKey: "NSNumber") as! NSNumber
   
   //Array类型
   var array:Array = ["123","456"]
   userDefault.set(array, forKey: "Array")
   array = userDefault.array(forKey: "Array") as! [String]
   
   //Dictionary类型
   var dictionary = ["1":"hangge.com"]
   userDefault.set(dictionary, forKey: "Dictionary")
   dictionary = userDefault.dictionary(forKey: "Dictionary") as! [String : String]
   ~~~

   ##### 系统对象的存取

   **以UILable为例**

   ~~~swift
   let userDefault = UserDefaults.standard
   
   //UILabel对象存储
   //将对象转换成Data流
   let label = UILabel()
   label.text = "欢迎访问hangge.com"
   let labelData = NSKeyedArchiver.archivedData(withRootObject: label)
   //存储Data对象
   userDefault.set(labelData, forKey: "labelData")
   
   //UILabel对象读取
   //获取Data
   let objData = userDefault.data(forKey: "labelData")
   //还原对象
   let myLabel = NSKeyedUnarchiver.unarchiveObject(with: objData!) as? UILabel
   print(myLabel)
   ~~~

   #### 删除存储对象

   如果删除的数据不存在，不报错。

   ~~~
   UserDefaults.standard.removeObject(forKey: "keyName")
   ~~~

   #### 使用UITableView跳屏（闪屏）问题

   ~~~swift
   // tableViewInstance是UITableView的实例
   tableViewInstance.estimatedRowHeight = 0
   tableViewInstance.estimatedSectionHeaderHeight = 0
   tableViewInstance.estimatedSectionFooterHeight = 0
   ~~~

   #### 设置导航栏初始化隐藏，随着滚动距离逐渐改变颜色

   ~~~swift
       func initNav(){
           navigationController?.navigationBar.barStyle = .default
           navigationController?.navigationBar.setBackgroundImage(nil, for: .default)
           navigationController?.navigationBar.shadowImage = nil
           let item = UIBarButtonItem(title: "", style: .plain, target: weakSelf!, action: nil)
           self.navigationItem.backBarButtonItem = item;
       }
       //MARK:设置界面滚动的代理
       func scrollViewDidScroll(_ scrollView: UIScrollView) {
           let barImageView = navigationController?.navigationBar.subviews.first
           let minAlphaOffset:CGFloat = 0
           let maxAlphaOffset:CGFloat = 50
           let offset = scrollView.contentOffset.y
   
           if offset > 10 {
               navigationController?.setNavigationBarHidden(false, animated: false)
               let alpha = (offset - minAlphaOffset) / (maxAlphaOffset - minAlphaOffset)
               barImageView?.alpha = alpha
               scrollView.bounces = false
           }else{
               navigationController?.setNavigationBarHidden(true, animated: false)
               scrollView.bounces = true
           }
       }
   ~~~

#### 使用WKWebView和UIProgressView实现网页的加载和进度条

~~~swift

//  d创建一个基类用于加载无交互的静态页面和用于其他扩展的父类

import UIKit
import RxSwift
import SnapKit
import WebKit


class BaseWebviewController: UIViewController {
    public var webview:WKWebView?
    lazy private var progressView: UIProgressView = {
        self.progressView = UIProgressView.init(frame: CGRect(x: CGFloat(0), y: CGFloat(getStatusBarAndNavigationBarHeight(controller: self)), width: SCREEN_WIDTH, height: CGFloat(10)))
        self.progressView.tintColor = COLOR_0197F6      // 进度条颜色
        self.progressView.trackTintColor = COLOR_WHITE // 进度条背景色
        return self.progressView
    }()
    private var titleString:String?
    private var urlStr:String?
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = COLOR_WHITE
        self.navigationController?.setNavigationBarHidden(false, animated: true)
        let item = UIBarButtonItem(title: "", style: .plain, target: self, action: nil)
        self.navigationItem.backBarButtonItem = item;
        navigationItem.title = titleString
        let webViewConfig = WKWebViewConfiguration()
        let preference = WKPreferences()
        preference.javaScriptCanOpenWindowsAutomatically = true
        webViewConfig.preferences = preference
//        webViewConfig.preferences.javaScriptCanOpenWindowsAutomatically = true
        webview = WKWebView.init(frame: CGRect(x: CGFloat(0), y:CGFloat(CGFloat(getStatusBarAndNavigationBarHeight(controller: self))), width: self.view.frame.width, height: self.view.frame.height - CGFloat(getStatusBarAndNavigationBarHeight(controller: self))), configuration: webViewConfig)
        self.automaticallyAdjustsScrollViewInsets = false
        if #available(iOS 11.0, *) {
            webview?.scrollView.contentInsetAdjustmentBehavior = .never
        } else {
            // Fallback on earlier versions
            self.edgesForExtendedLayout = UIRectEdge.top
            
        }
        
        setUpWKwebView()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        UIApplication.shared.statusBarStyle = .default
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
//        UIApplication.shared.statusBarStyle = .default
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    init(titleStr:String,webViewURLStr:String) {
        super.init(nibName: nil, bundle: nil)
        titleString = titleStr
        urlStr = webViewURLStr
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // 创建webview
    private func setUpWKwebView() {
        let url = URL.init(string: replaceURLPlaceholder(url: urlStr!))
        webview?.load(URLRequest.init(url: url!))
        webview?.backgroundColor = COLOR_WHITE
        view.addSubview(webview!)
        view.addSubview(progressView)
        self.progressView.progress = 0.1
        webview?.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)

    }

    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        
        //  加载进度条
        if keyPath == "estimatedProgress"{
            progressView.alpha = 1.0
            progressView.setProgress(Float((self.webview?.estimatedProgress) ?? 0), animated: true)
            if (self.webview?.estimatedProgress ?? 0.0)  >= 1.0 {
                UIView.animate(withDuration: 0.3, delay: 0.1, options: .curveEaseOut, animations: {
                    self.progressView.alpha = 0
                }, completion: { (finish) in
                    self.progressView.setProgress(0.0, animated: false)
                })
            }
        }
    }
    
    
    deinit {
        webview?.removeObserver(self, forKeyPath: "estimatedProgress")
        webview?.uiDelegate = nil
        webview?.navigationDelegate = nil
    }
}


~~~

