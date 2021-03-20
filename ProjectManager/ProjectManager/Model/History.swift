//
//  History.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import Foundation

class History {
    static let shared = History()
    private init() {}
    
    var list: [HistoryItem] = []
    
    func add(item: HistoryItem) {
        list.insert(item, at: 0)
    }
}
