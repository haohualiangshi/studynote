---
title: Swift常用函数总结
tags: [swift]
categories: 总结
---



#### 获取状态栏和导航栏的高度

~~~swift
func getStatusBarAndNavigationBarHeight(controller: UIViewController)->Float{
    let statusBarHeight=UIApplication.shared.statusBarFrame.height
    guard let navigationheight = controller.navigationController?.navigationBar.frame.height else{
        return Float(statusBarHeight)
    }
    return Float(statusBarHeight+navigationheight)
}
~~~

#### 获取状态栏高度

~~~swift
//获取状态栏高度
func getStatusBarHeight() -> Int {
    return Int(UIApplication.shared.statusBarFrame.height)
}
~~~

#### 获取导航栏的高度

~~~swift
//获取导航栏的高度
func getNavigationBarHeight(controller: UIViewController) -> Float {
    return Float((controller.navigationController?.navigationBar.frame.height)!)
}
~~~

#### 隐藏多余的cell分隔线

~~~
//MARK:隐藏多余的cell分割线
func hideTableViewExtraCellLineHidden(tableView : UITableView){
    let view = UIView()
    view.backgroundColor = UIColor.clear
    tableView.tableFooterView = view
    tableView.tableHeaderView = view
}
~~~

#### 根据时间戳格式化字符串

~~~swift
// MARK:- 根据时间戳和格式化字符串返回固定格式的字符串
func timeFormat(timestamp:Double,timeFormatStr:String) -> String{
    // 将时间戳转为固定格式的时间
    
    let now = NSDate.init(timeIntervalSince1970: timestamp/1000)
    let dateformatter = DateFormatter()
    dateformatter.dateFormat = timeFormatStr /*"yyyy年MM月dd日 HH:mm:ss"*/
    return dateformatter.string(from: now as Date)
}
~~~

#### 判断是否是网络URL

~~~swift
//MARK:判断是否是网络图片
func  isWebImage(path:String)->Bool{
    var isWebImage:Bool = false
    if(path.starts(with: "http://")||path.starts(with:"https://")){
        isWebImage=true
    }
    return isWebImage
}
~~~

#### 生成区间内随机数（整数）

~~~swift
// MARK:生成区间内随机数（整数）
func createRandomIn(min:UInt32,max:UInt32) -> Int{
    return Int(arc4random() % (max - min))  + Int(min)
    
}
~~~

#### 验证是否是纯数字

~~~swift
// 判断输入的字符串是否为数字，不含其它字符

public func isPurnInt(string: String) -> Bool {
    
    let scan: Scanner = Scanner(string: string)
    
    var val:Int = 0
    
    return scan.scanInt(&val) && scan.isAtEnd
    
}
~~~

#### 校验输入的是否是全数字且首位不能为0

~~~swift
// MARK: 校验输入的是否是全数字且首位不能为0
func judgeStrNotStartZero(str:String) -> Bool{
    let regex = "^[0-9]+";
    let predicate = NSPredicate(format: "SELF MATCHES %@", regex)
    return predicate.evaluate(with: str)
}
~~~

