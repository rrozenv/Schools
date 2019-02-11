//
//  NetworkError.swift
//  NetworkPlatform
//
//  Created by Robert Rozenvasser on 1/21/19.
//

import Domain

/// Error that can be decoded from server response
public struct ApiError: Error, Codable { }

/// 
public enum NetworkError: Error {
    case serverFailed
    case serverError(Error?, Int)
    case decodingError(String)
}

