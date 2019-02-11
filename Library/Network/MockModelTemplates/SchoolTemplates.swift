//
//  SchoolTemplates.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa
import Prelude

extension School {
    public static let template = School(
        id: "1",
        name: "School One",
        phoneNumber: "111-111-1111",
        city: "New York",
        address: "100 Main St.",
        state: "NY"
    )
    
    public static var templates: [School] {
        let schoo1 = School.template

        let school2 = School.template |>
            School.lens.id .~ "2" <>
            School.lens.name .~ "School Two" <>
            School.lens.city .~ "Boston" <>
            School.lens.state .~ "MA"

        return [schoo1, school2]
    }
    
}
