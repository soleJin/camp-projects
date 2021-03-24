//
//  URLManager.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import Foundation

enum HTTPMethod: CustomStringConvertible {
    case get
    case post
    case patch
    case delete
    
    var description: String {
        switch self {
        case .get:
            return "GET"
        case .post:
            return "POST"
        case .patch:
            return "PATCH"
        case .delete:
            return "DELETE"
        }
    }
}

enum Task {
    case loadTodos
    case loadTodo(id: Int)
    case uploadTodo(todo: Todo)
    case editTodo(id: Int, todo: Todo)
    case delete(id: Int, todo: Todo)
    
    var path: String {
        switch self {
        case .loadTodos, .uploadTodo:
            return "/todos"
        case .loadTodo(let id):
            return "todos/\(id)"
        case .editTodo(let id, _), .delete(let id, _):
            return "/todo/\(id)"
        }
    }
    var method: HTTPMethod {
        switch self {
        case .loadTodos, .loadTodo:
            return .get
        case .uploadTodo:
            return .post
        case .editTodo:
            return .patch
        case .delete:
            return .delete
        }
    }
    var encodedData: Data? {
        switch self {
        case .loadTodos, .loadTodo:
            return nil
        case .uploadTodo(let todo):
            return Parser.encodeData(todo)
        case .editTodo(_, let todo):
            return Parser.encodeData(todo)
        case .delete(_, let todo):
            return Parser.encodeData(todo)
        }
    }
}

struct URLManager {
    static let baseURL: URL = URL(string: "https://project-manager-server-app.herokuapp.com")!
    
    static private func makeURL(task: Task) -> URL {
        let path = task.path
        if path.isEmpty {
            return baseURL
        } else {
            return baseURL.appendingPathComponent(path)
        }
    }
    
    static func makeURLRequest(task: Task) -> URLRequest {
        let url = URLManager.makeURL(task: task)
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = task.method.description
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = task.encodedData
        return urlRequest
    }
}
