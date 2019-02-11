//
//  Networkable.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/31/19.
//

import Alamofire
import RxAlamofire
import RxSwift

public protocol NetworkServiceType: SchoolsUseCase {
    var baseApiUrl: URL { get }
    init(baseApiUrl: URL)
}

extension NetworkServiceType {
    
    public func getItems<T: Codable, E: Error & Codable>(type: T.Type,
                                                         for path: String,
                                                         parameters: [String: Any]? = nil,
                                                         encoding: ParameterEncoding = JSONEncoding.default,
                                                         headers: [String: String] = [:],
                                                         errorType: E.Type) -> Observable<[T]> {
        let absolutePath = "\(baseApiUrl.absoluteString)/\(path)"
        return RxAlamofire
            .requestData(.get,
                         absolutePath,
                         parameters: parameters,
                         encoding: encoding,
                         headers: headers)
            .mapArray(type: type, errorType: errorType)
    }
    
    public func getItem<T: Codable, E: Error & Codable>(for path: String,
                                                        parameters: [String: Any]? = nil,
                                                        encoding: ParameterEncoding = JSONEncoding.default,
                                                        headers: [String: String] = [:],
                                                        errorType: E.Type) -> Observable<T> {
        let absolutePath = "\(baseApiUrl.absoluteString)/\(path)"
        return RxAlamofire
            .requestData(.get,
                         absolutePath,
                         parameters: parameters,
                         encoding: encoding,
                         headers: headers)
            .mapObject(type: T.self, errorType: errorType)
    }
    
}
