//
//  ClosureFile.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/23.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import Foundation

public class Closure: NSObject {
    
    var closureVar:((Int,Int) ->Void)!
    
    var closureVar00:((Int,Int) ->Int)!
    
    
    //声明闭包
    typealias lewisCloser = (_ paramOne : String? ) -> ()
    //定义个变量 类型就是上面声明的闭包
    var customeCloser: lewisCloser?
    
    
    override init() {
        super.init()
    }
    
    //普通函数
    public func test01(_value:Int) -> Void {
        
    }
    
    
    func closureMethod() -> Void {
        //MARK:闭包  Closures
        //作为一个变量 或者常量
        
        let Closures = {
            (_ value:Int) ->Int in
            return value * value;
        }
        
        let Closures00 = {
            (_ valueA:Int ,_ valueB) ->Int in
            return valueA + valueB;
        }(10,5)  //和上面的写法一样
        
        
        let a = Closures(10)
        let b = Closures00
        print("闭包的值是 \(b)")
        
        test01(_value: 1)// 调用函数需要写形参，调用闭包不需要 只需要添值就可以
        
        //
        //函数式的返回值 嵌套函数
        func methodReturn(_ flag : Bool) -> (Int,Int) ->Int {
            
            func sumValues(v1:Int,v2:Int) -> Int{
                return v1 + v2
            }
            
            func multiValues(v1:Int,v2:Int) -> Int{
                return v1 * v2
            }
            
            return flag ? sumValues: multiValues
        }
        //闭包式返回 _ +形参 标识可以不用写形参 看下面的例子
        func closure(_ flag : Bool) -> (Int,Int) -> Int {
            return flag ? {(v1: Int,v2:Int) -> Int in  return v1 + v2} : {(v1: Int,v2:Int) -> Int in  return v1 * v2}
        }
        
        
        let methodValue = methodReturn(true)(10,10)
        //        let closureValue = closure(flag:true)(10,10)//会报错
        let closureValue = closure(true)(10,10)//不报错
        
    }
    
    //b闭包作为参数
    func loadRequest(callback:()->())  {
        callback()
    }
    
    func loadRequest0(callback: @escaping (Int,Int)->()) -> Void {
        closureVar = callback;
        
        //        callback(3,4)
    }
    
    func loadRequest00(callback: @escaping (Int,Int)->(Int)) -> Void {
        closureVar00 = callback;
        //        callback(3,4)
    }
    
    
    func loadReuqest01(v1:Int,callBack:@escaping ()->()) -> Void {
        
        
      
        if v1 / 2 == 0 {
            callBack()
        }
        
        //        guard v1 / 2 == 0 else {
        //            return
        //        }
    }
    
    func loadFuncs() -> Void {
        closureVar(3,4)
        let inside_c = closureVar00(5,6)
        print("携带返回值的闭包 参数 ，传出的值是 5，6. 得到的处理之后的值 是：\(inside_c)")
              
        if customeCloser != nil {
            customeCloser!("转发给另一个类的字符串")
        }
    }
    
    
}


class inSideClass_Closure: NSObject {
    func method00() {
        
        let obj = Closure()
        
        obj.loadRequest (callback: { () -> () in
            print("不省略省略括号 和 参数")
        })
        obj.loadRequest {
            print("省略省略括号 和 参数")
        }
        
        
        
        obj.loadRequest0 { (a, b) in
            let c = a + b
            print("闭包传值之后的值 传来的值是 \(a),\(b) 得出的结果:\(c)")
        }
        
        obj.loadRequest00 { (a, b) -> (Int) in
            return a + b
        }
        
        
        obj.loadReuqest01(v1: 3) {
            print("尾随闭包")
        }
        
        obj.customeCloser = { (val) -> () in
            print("来自另一个类的传递值：\(val!)");
        }
        
        obj.loadFuncs()
        
    }
}
