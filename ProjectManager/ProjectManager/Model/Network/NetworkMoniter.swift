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

class NetworkMoniter {
    static let shared = NetworkMoniter()
    private var moniter: NWPathMonitor
    private var queue = DispatchQueue.global()
    private var isOn: Bool = true
    
    weak var networkDelegate: NetworkStatusDelegate?
    
    private init() {
        self.moniter = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.moniter.start(queue: queue)
    }
    
    func start() {
        self.moniter.pathUpdateHandler = { path in
            self.isOn = path.status == .satisfied
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
