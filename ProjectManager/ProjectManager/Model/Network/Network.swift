//
//  Network.swift
//  ProjectManager
//
//  Created by sole on 2021/03/21.
//

import Network

class NetworkStatus {
    static let shared = NetworkStatus()
    private var moniter: NWPathMonitor
    private var queue = DispatchQueue.global()
    
    private init() {
        self.moniter = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.moniter.start(queue: queue)
    }
    
    func start() {
        self.moniter.pathUpdateHandler = { path in
            if path.status == .satisfied {
                print("==============> YEAH! <================")
            } else {
                print("=======> Here! noConnected!! =======")
            }
        }
    }
    
    func stop() {
        self.moniter.cancel()
    }
}
