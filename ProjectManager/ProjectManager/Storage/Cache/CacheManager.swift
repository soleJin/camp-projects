//
//  CacheManager.swift
//  ProjectManager
//
//  Created by Jinho Choi on 2021/03/20.
//

import Foundation

struct CacheManager {
    static var directoryURL: URL {
        let path: FileManager.SearchPathDirectory
        path = .cachesDirectory
        return FileManager.default.urls(for: path, in: .userDomainMask).first!
    }
    
    static func store(_ list: [Todo], as fileName: ItemStatus) {
        let url = directoryURL.appendingPathComponent(fileName.fileName, isDirectory: false)
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        do {
            let data = try encoder.encode(list)
            FileManager.default.createFile(atPath: url.path, contents: data, attributes: nil)
        } catch let error {
            print("Failed to store: \(error.localizedDescription)")
        }
    }
    
    static func retrive(_ fileName: ItemStatus) -> [Todo]? {
        let url = directoryURL.appendingPathComponent(fileName.fileName, isDirectory: false)
        guard FileManager.default.fileExists(atPath: url.path) else { return nil }
        guard let data = FileManager.default.contents(atPath: url.path) else { return nil }
        let decoder = JSONDecoder()
        do {
            let list = try decoder.decode([Todo].self, from: data)
            return list
        } catch let error {
            print("Failed to decode: \(error.localizedDescription)")
            return nil
        }
    }
}
