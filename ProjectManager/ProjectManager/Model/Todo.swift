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
    var status: Int
    var id: Int?
    
    enum CodingKeys: String, CodingKey {
        case title, id, status
        case deadLine = "deadline"
        case descriptions = "description"
    }
}
