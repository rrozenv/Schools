//
//  StocksUseCase.swift
//  Domain
//
//  Created by Robert Rozenvasser on 1/17/19.
//

import RxSwift
import Domain

public protocol SchoolsUseCase {
    func fetchSchools() -> Observable<SchoolEnvelope>
    func fetchSchoolDetails(for school: School) -> Observable<SchoolDetails>
}
