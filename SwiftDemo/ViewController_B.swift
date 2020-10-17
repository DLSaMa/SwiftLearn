//
//  ViewController_B.swift
//  SwiftDemo
//
//  Created by Qi Liu on 2020/9/23.
//  Copyright © 2020 Qi Liu. All rights reserved.
//

import UIKit

class ViewController_B: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ///   并发队列
//        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
//        ///  串行队列
//        let queue = DispatchQueue(label: "test.queue")
        
        
        let groupQueue = DispatchGroup()
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
//        let serail = DispatchQueue.
         defer {
            groupQueue.notify(queue: DispatchQueue.main) {
               debugPrint("执行完成\(Thread.current)")
            }
        }
        /// 第一种直接创建的时候就加到组中，执行完成自动出组
        queue.async(group: groupQueue) {
            for i in 0 ... 100 {
                debugPrint(Thread.current , i , "------1")
            }
        }
        /// 第二种自己执行前加入，完成后手动出组
        groupQueue.enter()
        queue.async() {
            for i in 0 ... 100 {
                debugPrint(Thread.current , i ,  "------2")
            }
            groupQueue.leave()
        }
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
