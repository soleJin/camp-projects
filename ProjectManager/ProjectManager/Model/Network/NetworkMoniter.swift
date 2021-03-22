//
//  Network.swift
//  ProjectManager
//
//  Created by sole on 2021/03/21.
//

import Network

protocol NetworkStatusDelegate: AnyObject {
    func isOn()
    func isOff()
}

class NetworkMoniter {
    static let shared = NetworkMoniter()
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
                self.networkDelegate?.isOn()
            } else {
                self.networkDelegate?.isOff()
            }
        }
    }
    
    func stop() {
        self.moniter.cancel()
    }
}
