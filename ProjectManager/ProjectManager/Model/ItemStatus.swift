//
//  ItemStatus.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/12.
//

import Foundation

enum ItemStatus {
    case todo
    case doing
    case done
    
    var title: String {
        switch self {
        case .todo:
            return "TODO"
        case .doing:
            return "DOING"
        case .done:
            return "DONE"
        }
    }
    
    var fileName: String {
        switch self {
        case .todo:
            return "todo.json"
        case .doing:
            return "doing.json"
        case .done:
            return "done.json"
        }
    }
}
