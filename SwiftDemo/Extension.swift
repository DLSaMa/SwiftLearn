//
//  Extension.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/22.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

/*
 
 扩展就是向一个已有的类、结构体或枚举类型添加新功能。

 扩展可以对一个类型添加新的功能，但是不能重写已有的功能。

 Swift 中的扩展可以：

 添加计算型属性和计算型静态属性
 定义实例方法和类型方法
 提供新的构造器
 定义下标
 定义和使用新的嵌套类型
 使一个已有类型符合某个协议
 语法
 
 
 
 语法
 扩展声明使用关键字 extension：

 extension SomeType {
     // 加到SomeType的新功能写到这里
 }
 一个扩展可以扩展一个已有类型，使其能够适配一个或多个协议，语法格式如下：

 extension SomeType: SomeProtocol, AnotherProctocol {
     // 协议实现写到这里
 }
 
 */



import Foundation

/*
 计算型属性
 扩展可以向已有类型添加计算型实例属性和计算型类型属性。

 实例
 下面的例子向 Int 类型添加了 5 个计算型实例属性并扩展其功能：
 */
extension Int {
   var add: Int {return self + 100 }
   var sub: Int { return self - 10 }
   var mul: Int { return self * 10 }
   var div: Int { return self / 5 }
}



struct sum {
    var num1 = 100, num2 = 200
}

struct diff {
    var no1 = 200, no2 = 100
}

struct mult {
    var a = sum()
    var b = diff()
}


extension mult {
    init(x: sum, y: diff) {
        _ = x.num1 + x.num2
        _ = y.no1 + y.no2
    }
}


//extension NWTCPConnectionState: CustomStringConvertible {
//    public var description: String {
//        switch self {
//            case .cancelled: return "Cancelled"
//            case .connected: return "Connected"
//            case .connecting: return "Connecting"
//            case .disconnected: return "Disconnected"
//            case .invalid: return "Invalid"
//            case .waiting: return "Waiting"
//        }
//    }
//}
   
class extensionClass: NSObject {
    
    
    func culFunc() -> Void {
        
        let addition = 3.add
        print("加法运算后的值：\(addition)")
            
        let subtraction = 120.sub
        print("减法运算后的值：\(subtraction)")
            
        let multiplication = 39.mul
        print("乘法运算后的值：\(multiplication)")
            
        let division = 55.div
        print("除法运算后的值: \(division)")

        let mix = 30.add + 34.sub
        print("混合运算结果：\(mix)")
        
        
        
        
        

        let a = sum(num1: 100, num2: 200)
        let b = diff(no1: 200, no2: 100)

        let getMult = mult(x: a, y: b)
//        print("getMult sum\(getMult.a.num1, getMult.a.num2)")
//        print("getMult diff\(getMult.b.no1, getMult.b.no2)")
        
    }
    
    
        
    
}
