//
//  SchoolDetails.swift
//  Domain
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Foundation

public struct SchoolDetails: Equatable {
    public let id: String
    public let name: String
    public let testTakerCount: String
    public let avgCriticalReadingScore: String
    public let avgMathScore: String
    public let avgWritingScore: String
    
    public init(id: String,
                name: String,
                testTakerCount: String,
                avgCriticalReadingScore: String,
                avgMathScore: String,
                avgWritingScore: String) {
        self.id = id
        self.name = name
        self.testTakerCount = testTakerCount
        self.avgCriticalReadingScore = avgCriticalReadingScore
        self.avgMathScore = avgMathScore
        self.avgWritingScore = avgWritingScore
    }
}

extension SchoolDetails: Codable {
    enum CodingKeys: String, CodingKey {
        case id = "dbn"
        case name = "school_name"
        case testTakerCount = "num_of_sat_test_takers"
        case avgCriticalReadingScore = "sat_critical_reading_avg_score"
        case avgMathScore = "sat_math_avg_score"
        case avgWritingScore = "sat_writing_avg_score"
    }
}

//"dbn": "01M292",
//"num_of_sat_test_takers": "29",
//"sat_critical_reading_avg_score": "355",
//"sat_math_avg_score": "404",
//"sat_writing_avg_score": "363",
//"school_name": "HENRY STREET SCHOOL FOR INTERNATIONAL STUDIES"
