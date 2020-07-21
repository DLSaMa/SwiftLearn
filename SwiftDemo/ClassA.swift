//
//  ClassA.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/7.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import UIKit

class ClassA: NSObject {
    override init() {
        super.init()
        
    }
    
    public func methodClassA() -> Void{
        
    }
    
   public func methodConvention() ->  Void{
        print("静态方法")
    }
    
   private func methodprivate() ->  Void{
        print("私有方法")
    }
    
  public  static func methodStatic() ->  Void{
          print("静态方法")
      }

}
