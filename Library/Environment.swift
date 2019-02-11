//
//  Environment.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/17/19.
//

import Domain

public struct Environment {
    public let apiService: NetworkServiceType
    public let storage: StorageType
    
    public init(apiService: NetworkServiceType = NetworkService(),
                storage: StorageType = NetworkStorage()) {
        self.apiService = apiService
        self.storage = storage
    }
}

