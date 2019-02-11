//
//  MockNetworkService.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/8/19.
//

import Alamofire
import RxAlamofire
import RxSwift
import Domain
import Prelude
import RxCocoa

public struct MockNetworkService: NetworkServiceType {

    public let baseApiUrl: URL
    
    public init(baseApiUrl: URL = Configuration.rootURL) {
        self.baseApiUrl = baseApiUrl
    }
    
    public let error$ = BehaviorRelay<Error?>(value: nil)
    
}

// MARK: - SchoolsUseCase
extension MockNetworkService {
    
    public func fetchSchools() -> Observable<SchoolEnvelope> {
        guard error$.value == nil else { return .error(error$.value!) }
        return .just(SchoolEnvelope(schools: School.templates))
    }

    public func fetchSchoolDetails(for school: School) -> Observable<SchoolDetails> {
        guard error$.value == nil else { return .error(error$.value!) }
        return .just(SchoolDetails.template)
    }
    
}
