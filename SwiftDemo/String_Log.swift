//
//  String_Log.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/29.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import Foundation
import UIKit

class String_Log: NSObject {
    
    override init() {
        super.init()
    }
    
    func demo3()  {
          let h = 8
          let m = 9
          let s = 6
          let dateStr = "\(h):\(m):\(s)"
          let dateStr1=String(format: "%02d:%02d:%02d", h,m,s)
          print(dateStr)
          print(dateStr1)
      }

      func demo2()  {
          
          // 拼接字符串需要注意可选项optional
          let name = "老王"
          let age = 18
          let title:String? = " BOSS"
          let point = CGPoint(x: 100, y: 200)
          
          
          
          let str = "\(name)\(age)\(title)\(point)"
          print(str)
          //  打印：老王18Optional(" BOSS")(100.0, 200.0)
          
          
      }
    
    func demo4()  {
        
        //打印方法名
        let file = #file
        let functionName = #function
        let line = #line
        print(file + "__\(line)__:"+functionName)
        
//        打印地址
//        var point = CGPoint.zero
//            withUnsafePointer(to: &point) {
//               print(" str value \(point) has address: \($0)")
//            }
    }
    
}
