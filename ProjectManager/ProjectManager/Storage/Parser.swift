//
//  Parser.swift
//  ProjectManager
//
//  Created by sole on 2021/03/23.
//

import Foundation

struct Parser {
    static func encodeData<T: Encodable>(_ value: T) -> Data? {
        let encoder = JSONEncoder()
        do {
            let jsonData = try encoder.encode(value)
            return jsonData
        } catch let error {
            print("encoding error: \(error.localizedDescription)")
            return nil
        }
    }
    
    static func decodeData<T: Decodable>(_ type: T.Type, _ data: Data) -> T? {
        let decoder = JSONDecoder()
        do {
            let response = try decoder.decode(type, from: data)
            return response
        } catch let DecodingError.dataCorrupted(context) {
            print("decoding error: \(context)")
        } catch let DecodingError.keyNotFound(key, context) {
            print("Key `\(key)` not found: \(context.debugDescription)")
            print("codingPath: \(context.codingPath)")
        } catch let DecodingError.valueNotFound(value, context) {
            print("Value `\(value)` not found: \(context.debugDescription)")
            print("codingPath: \(context.codingPath)")
        } catch let DecodingError.typeMismatch(type, context) {
            print("Type `\(type)` mismatch: \(context.debugDescription)")
            print("codingPath: \(context.codingPath)")
        } catch let error {
            print("error: \(error)")
        }
        return nil
    }
}
