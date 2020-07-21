
//
//  lazyTest.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/20.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import Foundation
import UIKit
class student: NSObject {

    //懒加载 
    lazy var str:String = "需要时候调用"
    
    //方法的懒加载
    lazy var method: String = student.test();
    static  func test() -> String {
        return "需要时再调用"
    }
    
    
    lazy var view : UIView = {
        let view = UIView()
        return view;
    }()
    
    
    func lazyTest() -> Void {
        let s:student = student();
        print(s.method);
        
    }
    
}
