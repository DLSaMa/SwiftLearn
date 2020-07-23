//
//  EnumFile.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/7/22.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import Foundation

/*
 枚举值

 与OC不一样，Swift的枚举牛逼得多了，OC只能玩Int，他能玩：

 整型(Integer)
 浮点数(Float Point)
 字符串(String)
 布尔类型(Boolean)
 */

 public enum Movement {
    case letf
    case right
    case top
    case bottom
}

enum Movement00:Int {
    case left = 0
    case right = 1
    case top = 2
    case bottom = 3
}

enum Area: String {
    case DG = "dongguan"
    case GZ = "guangzhou"
    case SZ = "shenzhen"
}



//MARK:嵌套枚举
enum Area00 {
    enum DongGuan {
        case NanCheng
        case DongCheng
    }
    
    enum GuangZhou {
        case TianHe
        case CheBei
    }
}

//MARK:对枚举的extension
public enum NWTCPConnectionState : Int {
    case invalid
    case connecting
    case waiting
    case connected
    case disconnected
    case cancelled
}

extension NWTCPConnectionState: CustomStringConvertible  {//CustomStringConvertible protocol
    public var description: String {
        switch self {
            case .cancelled: return "Cancelled"
            case .connected: return "Connected"
            case .connecting: return "Connecting"
            case .disconnected: return "Disconnected"
            case .invalid: return "Invalid"
            case .waiting: return "Waiting"
        }
    }
}





//MARK: CustomStringConvertible协议可以用来打印自定义的类和结构体
/*
 print 语句输出的内容只是这个结构的名称，这显然不是我们希望的结果，我们更多情况下需要的是它能够输出 Music 实例的内容。我们来修改一下 Music 类的定义，让它实现 CustomStringConvertible 协议：
 */


struct Music {
    let name: String
    let singer: String
    
    init(name: String, singer: String) {
        self.name = name
        self.singer = singer
    }
}

////实现 CustomStringConvertible 协议，方便输出调试
extension Music: CustomStringConvertible {
    var description: String {
        return "name: \(name) singer: \(singer)"
    }
}

//可以声明的时候直接继承 CustomStringConvertible 协议
enum DownUpPhase: CustomStringConvertible {
      case MovingDown, MovingUp
      var description: String {
          get {
              switch self {
              case .MovingDown:
                  return "Moving Down"
              case .MovingUp:
                  return "Moving Up"
              }
          }
      }
  }

class EnumFile: NSObject {
    
    func test() -> Void {
        print(Area00.DongGuan.DongCheng)
        
        let enmuV1 = NWTCPConnectionState.waiting
        
        var enmuV2 : NWTCPConnectionState = NWTCPConnectionState.waiting
        var enmuV3 : NWTCPConnectionState = .waiting
        
        
        let enmuV4 = Music(name: "七里香", singer: "周杰伦")
        print("来自枚举类的内容 --\(enmuV4)")
        /*
         未实现 CustomStringConvertible 协议,输出结构体名称
         来自枚举类的内容 --Music(name: "七里香", singer: "周杰伦")
         
         实现 CustomStringConvertible 协议
         来自枚举类的内容 --name: 七里香 singer: 周杰伦
         
         */
           
    }
    
}
