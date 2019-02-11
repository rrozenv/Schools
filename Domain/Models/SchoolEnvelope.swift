//
//  SchoolEnvelope.swift
//  Domain
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Foundation

public struct SchoolEnvelope: Codable, Equatable {
    public let schools: [School]
    
    public init(schools: [School]) {
        self.schools = schools
    }
}

