//
//  SchoolDetailsTemplates.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Domain
import RxSwift
import RxCocoa
import Prelude

extension SchoolDetails {
    public static let template = SchoolDetails(
        id: "1",
        name: "School One",
        testTakerCount: "1",
        avgCriticalReadingScore: "700",
        avgMathScore: "750",
        avgWritingScore: "800"
    )
}
