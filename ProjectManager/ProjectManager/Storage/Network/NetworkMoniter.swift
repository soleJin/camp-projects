//
//  Network.swift
//  ProjectManager
//
//  Created by sole on 2021/03/21.
//

import Network

protocol NetworkMoniterDelegate: AnyObject {
    func didConnect()
    func didDisconnect()
}

class NetworkMoniter {
    static let shared = NetworkMoniter()
    private var moniter: NWPathMonitor
    private var queue = DispatchQueue.global()
    
    weak var delegate: NetworkMoniterDelegate?
    
    private init() {
        self.moniter = NWPathMonitor()
        self.queue = DispatchQueue.global(qos: .background)
        self.moniter.start(queue: queue)
    }
    
    func start() {
        self.moniter.pathUpdateHandler = { path in
            if path.status == .satisfied {
                self.delegate?.didConnect()
            } else {
                self.delegate?.didDisconnect()
            }
        }
    }
    
    func stop() {
        self.moniter.cancel()
    }
}
