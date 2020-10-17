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

class THHPMETHOD {
    
}

public protocol EventType: CustomStringConvertible {}

class ViewController: UIViewController,UITableViewDelegate{
//    class ViewController<T: EventType>: UIViewController,UITableViewDelegate{

    
    struct writeTag {
         
         static let requestHeader: Int   = 1
         static let requestPayload: Int  = 2
         
         static let responseHeader: Int  = 3
         static let responsePayload: Int = 4
         
         static let connectHeader: Int   = 5
         
         static let connectIn: Int       = 6
         static let connectOut: Int      = 7
         
     }
    
    struct readTag {
          
          static let requestHeader: Int   = 1
          static let responseHeader: Int  = 2
          
          static let requestPayload: Int  = 3
          static let responsePayload: Int = 4
          
          static let connectIn: Int       = 5
          static let connectOut: Int      = 6
          
      }
    
//    struct readTag {
//
//          let requestHeader: Int   = 1
//          let responseHeader: Int  = 2
//
//          let requestPayload: Int  = 3
//          let responsePayload: Int = 4
//
//          let connectIn: Int       = 5
//          let connectOut: Int      = 6
//
//     }
//
    
    fileprivate var requestHeader: THHPMETHOD!
    
    var listView : UITableView!;//Swift中要求变量或常量在声明时就要初始化其值,在实际开发中，声明变量或常量时使用可选类型。
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    
    
    
    
//    func throwDeliver(num:Int) throws ->String {
//           print("错误传递")
//           try numberTest(num: num)
//           print("未传递错误")
//           return "无错误"
//       }
//    
//       func numberTest(num:Int) throws{
//           if num == 1 {
//               print("成功")
//           }else if num == 2 {
//               throw OperationError.ErrorTwo
//           }else if num == 3{
//               throw OperationError.ErrorThree("失败")
//           }else {
//               throw OperationError.ErrorOther
//           }
//
//       }
    
    
    
    
    
    
    
    
//    func generic(event:T) -> Int {
//        return 2;
//    }
    
    func generic0<E: EventType>(event:E) -> Int {
           return 2;
       }
    
    func structTest(a:Int) {
        print("just test \(a)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var a:Int = 20;
        
        var b:Int = 5;
        
        a -= b;
        
        print("a 的值 \(a)");
        
        
        
        
//        let s = "Swift"
//        let i = s.index(s.startIndex, offsetBy: 4)
//        let t = s.index(s.startIndex, offsetBy: 2)
//        print(s[i])
//        print("i 的位置 \(i)")
//        print("t 的位置 \(t)")
            
        let raw_dom = "s,apple.com"
        
        let index = raw_dom.index(raw_dom.startIndex, offsetBy: 1)
        let index2 = raw_dom.index(raw_dom.startIndex, offsetBy: 2)
        //s,apple.com
        let typeStr = raw_dom.substring(to: index) //s 或者 k
        let url = raw_dom.substring(from: index2)  // apple.com
        
                print("typeStr 的值 \(typeStr)")
                print("url 的值 \(url)")
        
        Tool.rangetestT();
        
//        let re:readTag = readTag.init()
        
        
        structTest(a: readTag.requestHeader)
        
        rangetest()
        
//        generic(event: 2 )
        
        let frame = CGRect.init(x: 100, y: 100, width: 100, height: 100)
        listView = UITableView.init(frame: frame, style: .plain)
        listView.delegate = self
        
        
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
        
        
//        self.sendLog(msg: "a string frome swift demo")
        
        let name  = String.init(format: "\(#function) in \(object_getClassName(self))")
       
        self.sendLog(msg: name)
//        print("\(#function) in \(#file)")
        
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
    
    
    func swapTwoIntValue(a: inout Int, b: inout Int){
        let tempValue = a
        a = b
        b = tempValue
    }
    
    //MARK:可选类型
    func optionalFunc(value:Int,str:String) -> Int {
        
        var optionalValue : Int?//Swift 的可选（Optional）类型，用于处理值缺失的情况。可选表示"那儿有一个值，并且它等于 x "或者"那儿没有值"。
        var optionalValueB : Optional<Int>
        return 1;
    }
    func swapTwoValue<T>(a: inout T, b: inout T){
        let tempValue = a
        a = b
        b = tempValue
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
    
    
    
    class division {
        var count: Int = 0
        func incrementBy(no1: Int, _ no2: Int) {
            count = no1 / no2
            print(count)
        }
    }
//
//    let counter = division()
//    counter.incrementBy(no1: 1800, no2: 3)
//    counter.incrementBy(no1: 1600, no2: 5)
//    counter.incrementBy(no1: 11000, no2: 3)
//
    
    
    func rangetest()  {
        let myRange: ClosedRange = 1...3
        let myArray = ["a", "b", "c", "d", "e"]
        myArray[myRange] // ["b", "c", "d"]
        
        
        
        let CRLF2DataTest: Data = "abcdef\r\n\r\n".data(using: .ascii)!
        
        let CRLF2Data: Data = "\r\n\r\n".data(using: .ascii)!
           
        
        if let CRLF2Range1: Range<Data.Index> = CRLF2DataTest.range(
                   of: CRLF2Data,
                   options: .backwards,
                   in: CRLF2DataTest.startIndex..<CRLF2DataTest.endIndex
                   )
        {
            let subData: Data = CRLF2DataTest.subdata(
                           in: CRLF2DataTest.startIndex..<CRLF2Range1.lowerBound
                       )
            
            let str = String.init(data: subData, encoding: .utf8)
                       NSLog("wuplyer http---- 写入APP 写入内容 \n%@  ", str ?? "")
            
        }
        
        
        let someString = "今天你恰饭了吗"
        // someRang的类型是 Range<String.Index>?
        if let someRange = someString.range(of: "恰饭") {
            print(someString[someRange])
            // 恰饭
            print(someString[someRange.lowerBound])
            // 恰
            print(someString[someRange.upperBound])
            // 了
            
        }
        
        
    }
    
}

