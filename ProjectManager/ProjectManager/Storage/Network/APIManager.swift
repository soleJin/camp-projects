//
//  ProjectManagerAPI.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import Foundation

struct APIManager<T: Codable> {
    static func request(task: Task, completion: @escaping (T?) -> Void) {
        let session = URLSession(configuration: .default)
        guard let requestURL = task.urlRequest else { return }
        let dataTask = session.dataTask(with: requestURL) { data, response, error in
            let successRange = 200..<300
            guard error == nil,
                  let statusCode = (response as? HTTPURLResponse)?.statusCode,
                  successRange.contains(statusCode) else {
                print("statusCode오류")
                completion(nil)
                return
            }
            guard let resultData = data else {
                print("data없음")
                completion(nil)
                return
            }
            guard let todos = Parser.decodeData(T.self, resultData) else {
                print("Decoing실패")
                completion(nil)
                return
            }
            completion(todos)
        }
        dataTask.resume()
    }
}
