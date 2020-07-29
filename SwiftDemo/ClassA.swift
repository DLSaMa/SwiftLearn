//
//  ClassA.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/7.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import UIKit

extension String {
    //将原始的url编码为合法的url
    func urlEncodedforthis() -> String {
        let encodeUrlString = self.addingPercentEncoding(withAllowedCharacters:
            .urlQueryAllowed)
        return encodeUrlString ?? ""
    }

    //将编码后的url转换回原始的url
    func urlDecoded() -> String {
        return self.removingPercentEncoding ?? ""
    }
}


class ClassA: NSObject {
    override init() {
        super.init()
        let str = "qwer"
        str.urlEncodedforthis()
        
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
