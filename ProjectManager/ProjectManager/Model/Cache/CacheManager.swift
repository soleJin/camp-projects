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
}
