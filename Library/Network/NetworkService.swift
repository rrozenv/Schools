//
//  NetworkService.swift
//  NetworkPlatform
//
//  Created by Robert Rozenvasser on 1/17/19.
//

import Alamofire
import RxAlamofire
import RxSwift
import Domain
import Prelude
import RxOptional

public typealias BackgroundSchedular = ConcurrentDispatchQueueScheduler

private enum Path: String {
    case schools = "resource/97mf-9njv.json"
    case schoolDetails = "resource/734v-jeq5.json"
}

public struct NetworkService: NetworkServiceType {

    public let baseApiUrl: URL

    public init(baseApiUrl: URL = Configuration.rootURL) {
        self.baseApiUrl = baseApiUrl
    }

}

// MARK: - SchoolsUseCase
extension NetworkService {
    
    public func fetchSchools() -> Observable<SchoolEnvelope> {
        // Cached result if it exists.
        let cachedResult = App.current.storage.retrieve(SchoolEnvelope.self).asObservable()
        
        // New network result which overrwrites latest cache.
        let networkResult = getItems(type: School.self,
                                     for: Path.schools.rawValue,
                                     errorType: ApiError.self)
            .map(SchoolEnvelope.init)
            .flatMap { result -> Observable<SchoolEnvelope> in
                return App.current.storage.store(result)
                    .asObservable()
                    .mapObject(type: SchoolEnvelope.self, errorType: ApiError.self)
                    .concat(Observable.just(result))
        }
        
        return cachedResult.concat(networkResult)
    }
    
    public func fetchSchoolDetails(for school: School) -> Observable<SchoolDetails> {
        return getItems(type: SchoolDetails.self,
                        for: Path.schoolDetails.rawValue,
                        parameters: ["dbn": school.id],
                        encoding: URLEncoding.default,
                        errorType:  ApiError.self)
            .map { $0.first }
            .errorOnNil(NetworkError.serverError(SchoolDetailError.schoolNotFound, 404))
    }
    
}



