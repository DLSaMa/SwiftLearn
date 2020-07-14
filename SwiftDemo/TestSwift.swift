//
//  SwiftFile.swift
//  WuNetWork
//
//  Created by Qi Liu on 2020/7/10.
//  Copyright © 2020 WU. All rights reserved.
//

import Foundation

class TestSwift: NSObject {
    override init() {
        super.init()
    }
    
    //@objc oc文件里创建的swift对象 想要调用此函数，前面需要添加@objc
   @objc func swiftMethod(value:Int) -> Int {
        return value * value
    }
}
