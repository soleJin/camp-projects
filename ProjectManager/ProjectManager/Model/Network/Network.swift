//
//  Network.swift
//  ProjectManager
//
//  Created by sole on 2021/03/21.
//

import Network

protocol NetworkStatusDelegate: AnyObject {
    func isConnected()
    func isdisConnected()
}

class NetworkStatus {
    static let shared = NetworkStatus()
    private var moniter: NWPathMonitor
    private var queue = DispatchQueue.global()
    
    weak var networkDelegate: NetworkStatusDelegate?
    
    private init() {
        self.moniter = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.moniter.start(queue: queue)
    }
    
    func start() {
        self.moniter.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.networkDelegate?.isConnected()
            } else {
                self.networkDelegate?.isdisConnected()
            }
        }
    }
    
    func stop() {
        self.moniter.cancel()
    }
}
