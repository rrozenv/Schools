//
//  SchoolsUseCase.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import RxSwift
import Domain

public protocol SchoolsUseCase {
    func fetchSchools() -> Observable<SchoolEnvelope>
    func fetchSchoolDetails(for school: School) -> Observable<SchoolDetails>
}


