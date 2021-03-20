//
//  HistoryItem.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import Foundation

struct HistoryItem {
    let behavior: String
    let item: Todo
    var movedFrom: String?
    var moveTo: String?
}
