//
//  App.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/20/19.
//

import Foundation
import Domain

public struct App {
    // ** MARK: - Private Static Properties
    /// Enviroment container initalized with default enviroment.
    private static var stack: [Environment] = [Environment()]
    
    // ** MARK: - Public Static Properties
    /// Returns the current enviroment.
    public static var current: Environment! { return stack.last }
    
    /// Convenience to get the current api service.
    public static var apiService: NetworkServiceType { return App.current.apiService }

}

// ** MARK: - Enviroment Static Methods
extension App {
    
    /// Push a new environment onto the stack.
    public static func pushEnvironment(_ env: Environment) {
        stack.append(env)
    }
    
    /// Pop an environment off the stack.
    @discardableResult
    public static func popEnvironment() -> Environment? {
        return stack.popLast()
    }
    
    // Replace the current environment with a new environment.
    public static func switchCurrentEnvironment(to env: Environment) {
        stack.removeLast()
        pushEnvironment(env)
    }
    
    /// Replaces the current environment onto the stack with an environment that changes a subset of the global dependencies.
    public static func replaceCurrentEnvironment(
        apiService: NetworkServiceType = current.apiService,
        storage: StorageType = current.storage) {
        switchCurrentEnvironment(to:
            Environment(
                apiService: apiService,
                storage: storage
            )
        )
    }
    
}

