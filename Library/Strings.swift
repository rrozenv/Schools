//
//  Strings.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Foundation

public enum Strings {
    
    public static func schools() -> String {
        return localizedString(
            key: "schools",
            defaultValue: "Schools",
            count: nil,
            substitutions: [:]
        )
    }
    
    public static func avg_reading_score(score: String) -> String {
        return localizedString(
            key: "avg_reading_score",
            defaultValue: "SAT Reading Score: %{score}",
            count: nil,
            substitutions: ["score": score]
        )
    }
    
    public static func avg_math_score(score: String) -> String {
        return localizedString(
            key: "avg_math_score",
            defaultValue: "SAT Math Score: %{score}",
            count: nil,
            substitutions: ["score": score]
        )
    }
    
    public static func avg_writing_score(score: String) -> String {
        return localizedString(
            key: "avg_writing_score",
            defaultValue: "SAT Writing Score: %{score}",
            count: nil,
            substitutions: ["score": score]
        )
    }
    
    public static func school_not_found() -> String {
        return localizedString(
            key: "school_not_found",
            defaultValue: "Oops! School not found.",
            count: nil,
            substitutions: [:]
        )
    }

}

