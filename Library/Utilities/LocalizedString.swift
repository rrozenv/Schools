//
//  LocalizedString.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/21/19.
//

import Foundation

/**
 Finds a localized string for a provided key and interpolates it with substitutions.
 
 - parameters:
 - key:           The key of the string to find in a bundle.
 - defaultValue:  Optional value to use in case a string could not be found for the provided key.
 - substitutions: A dictionary of key/value substitutions to be made.
 
 - returns: The localized string. If the key does not exist the `defaultValue` will be returned,
 and if that is not specified an empty string will be returned.
 */
public func localizedString(key: String,
                            defaultValue: String = "",
                            count: Int? = nil,
                            substitutions: [String: String] = [:]) -> String {
    
    // When a `count` is provided we need to augment the key with a pluralization suffix.
    let augmentedKey = count
        .flatMap { key + "." + keySuffixForCount($0) }
        ?? key
    
    return substitute(augmentedKey.localized(), with: substitutions)
}

// Returns the pluralization suffx for a count.
private func keySuffixForCount(_ count: Int) -> String {
    switch count {
    case 0:
        return "zero"
    case 1:
        return "one"
    case 2:
        return "two"
    case 3...5:
        return "few"
    default:
        return "many"
    }
}

/// Performs simple string interpolation on keys of the form `%{key}`.
private func substitute(_ string: String, with substitutions: [String: String]) -> String {
    return substitutions.reduce(string) { accum, sub in
        return accum.replacingOccurrences(of: "%{\(sub.0)}", with: sub.1)
    }
}

/// Finds the string associted with the key (self) in the Localizable.strings file
extension String {
    public func localized(bundle: Bundle = .main, tableName: String = "Localizable") -> String {
        return NSLocalizedString(self, tableName: tableName, value: "**\(self)**", comment: "")
    }
}
