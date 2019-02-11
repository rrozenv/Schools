//
//  StorageType.swift
//  Domain
//
//  Created by Robert Rozenvasser on 1/20/19.
//

import RxSwift

public protocol StorageType {
    func store<T: Encodable>(_ object: T, for path: String?, to directory: Directory) -> Completable
    func retrieve<T: Decodable>(_ type: T.Type, for path: String?, from directory: Directory) -> Maybe<T>
    func clear(_ directory: Directory)
    func removeAllObjects(for path: String, from directory: Directory)
}

extension StorageType {
    func store<T: Encodable>(_ object: T, for path: String? = nil, to directory: Directory = .documents) -> Completable {
        return store(object, for: path, to: directory)
    }
    
    func retrieve<T: Decodable>(_ type: T.Type, for path: String? = nil, from directory: Directory = .documents) -> Maybe<T> {
        return retrieve(type, for: path, from: directory)
    }
}





