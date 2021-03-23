//
//  Todo.swift
//  ProjectManager
//
//  Created by sole on 2021/03/09.
//

import Foundation

struct Todo: Codable {
    var title: String
    var descriptions: String?
    var deadLine: Date?
}
