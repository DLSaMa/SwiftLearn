//
//  ViewController.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/7.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import UIKit


//extension String {
//    //将原始的url编码为合法的url
//    func urlEncoded() -> String {
//        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
//            .urlQueryAllowed)
//        return encodeUrlString ?? ""
//    }
//
//    //将编码后的url转换回原始的url
//    func urlDecoded() -> String {
//        return self.removingPercentEncoding ?? ""
//    }
//}
//


class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        self.test();
        //        self.extentTest()
        //
        //        let file  = EnumFile()
        //        file.test()
        //
        //
        //        let objclassA = ClassA()
        //        let objClosuer = inSideClass_Closure()
        //        objClosuer.method00()
        //
        //
        //
        //        objclassA.methodClassA()
        //        objclassA.methodConvention()
        //        //        objclassA.methodprivate()
        //        //         objclassA.methodStatic()
        //        ClassA.methodStatic()
        //
        //
        //        let bounds = self.minMax(array: [8, -6, 2, 109, 3, 71])
        //
        //        //数组声明
        //        var array:[Int] = []
        //        var arrayString:[String] = []
        //
        //        let arrayApp:Array<Int> = [1,2,3,4]
        //
        //
        //
        //        array = [1,2,3,4]
        //
        //        let boundsV = minMax(array: arrayApp)
        //        let dic = ["key00":"value00","key01":"value01"]
        //        print("最小值为 \(bounds.min) ，最大值为 \(bounds.max)")
        //        // Do any additional setup after loading the view.
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //
        //        //MARK:枚举
        //        let emunValue = Movement.letf
        //        switch emunValue {
        //        case .letf:
        //            print("left")
        //        case .right:
        //            print("right")
        //        case .top:
        //            print("top")
        //        case .bottom:
        //            print("bottom")
        //        default:()
        //
        //        }
        
        
        self.sendLog(msg: "a string frome swift demo")
        
    }
    
    
    
    func sendLog(msg:String) -> Void {
        print("请求")
        let urlStr  = String.init(format: ("http://182.92.2.5:8805/write?msg=\(msg)" as NSString) as String)
    
        let fiaurl = URL.init(string: urlStr.tun_urlEncoded())
        let request = URLRequest.init(url: fiaurl!)
        let session = URLSession.shared
        session.dataTask(with: request) { (dataT, resp, err) in
            if err != nil{
            }else{
                let str = NSString.init(data: dataT! , encoding:String.Encoding.utf8.rawValue)
                print("返回结果:\(String(describing: str))")
            }
        }.resume()
        //        let dataTask = session.dataTask(with: request, completionHandler: { (data,resp,err) in
        //
        //
        //        })
        //        dataTask.resume()
    }
    
    
    
    
    
    func test(){
        let myString = "Hello World!"
        let `class` = "RunBoob" //使用关键词
        print(`class`)
        
        
        print(myString)
        print("hello Test");print("Hello str")
        
        
        
        let myView = UIView.init(frame: CGRect.init(x: 100, y: 100, width: 200, height: 300));
        myView.backgroundColor = UIColor.red;
        self.view .addSubview(myView)
        
        //        let myString = String:""
        
    }
    
    func returnTest() -> Int {
        let a = 1 + 1
        let b:Int = 10
        
        return a
        //        return "return Test"
    }
    
    func returnTest00() -> String {
        let str:String = "return Test"
        //            return a
        return str
    }
    
    func functest() -> Void {
        let str:String = ""
        if str.isEmpty {
            print("空字符串")
        }
        
    }
    
    //    public
    public  func extentTest() -> Void {
        typealias Feet = Int //类型别名
        let distance :Feet = 100
        print(distance)
        
        
        //        var varA = 42
        //        varA = "This is hello"
        //        print(varA)
        let varB = 42 // meaningOfLife 会被推测为 Int 类型
        let varC = 3.1415926 // pi 会被推测为 Double 类型
        
        
        //声明变量
        var varD:Int
        varD = 10
        varD = 20
        
        print("此时的值:%d",varD)
        
        let 你好 = "你好，世界"
        print(你好)
        
        let name = "菜鸟教程"
        let site = "http://www.runoob.com"
        print("\(name)的地址是\(site)")
        
    }
    
    //MARK:可选类型
    func optionalFunc(value:Int,str:String) -> Int {
        
        var optionalValue : Int?//Swift 的可选（Optional）类型，用于处理值缺失的情况。可选表示"那儿有一个值，并且它等于 x "或者"那儿没有值"。
        var optionalValueB : Optional<Int>
        return 1;
    }
    
    
    
    func minMax(array: [Int]) -> (min: Int, max: Int) {
        var currentMin = array[0]
        var currentMax = array[0]
        for value in array[1..<array.count] {
            if value < currentMin {
                currentMin = value
            } else if value > currentMax {
                currentMax = value
            }
        }
        return (currentMin, currentMax)
    }
    
    
}

