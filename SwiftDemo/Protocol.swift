//
//  Protocol.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/8/21.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import Foundation
public protocol RawTCPSocketProtocol : class {
    
     var isConnected: Bool { get }///If the socket is connected.
    func connectTo(host: String, port: Int, enableTLS: Bool, tlsSettings: [AnyHashable: Any]?) throws
      func disconnect()
}
