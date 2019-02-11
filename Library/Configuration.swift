//
//  Configuration.swift
//  NetworkPlatform
//
//  Created by Robert Rozenvasser on 1/20/19.
//

import Foundation

// MARK: - Configuration
/// Reads values from plist.
public struct Configuration {
    
    private static let infoDictionary: [String: Any] = Bundle.main.infoDictionary!

    public static let rootURL: URL = {
        let rootURLstring = Configuration.infoDictionary[Keys.Plist.rootURL] as! String
        return URL(string: rootURLstring)!
    }()
    
    public static let buildVersion: String = {
        return Configuration.infoDictionary[Keys.Plist.buildVersion] as? String ?? "1"
    }()
    
}

// MARK: - Keys
extension Configuration {
    
    private enum Keys {
        enum Plist {
            static let rootURL = "ROOT_URL"
            static let buildVersion = "CFBundleVersion"
        }
    }
    
}
