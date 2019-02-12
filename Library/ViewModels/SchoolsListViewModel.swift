//
//  SchoolsListViewModel.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import RxSwift
import RxCocoa
import Domain

public class SchoolsListViewModel {
    
    // MARK: - Inputs
    public typealias Inputs = (
        initalLoad$: Observable<Void>,
        selectedIndexPath$: Observable<IndexPath>
    )
    
    // MARK: - Outputs
    public typealias Outputs = (
        formattedSchools$: Driver<[SchoolViewModel]>,
        loading$: Driver<Bool>,
        error$: Driver<Error>
    )
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let apiService: SchoolsUseCase
    
    // MARK: - Initalization
    public init(apiService: SchoolsUseCase = App.apiService) {
        self.apiService = apiService
    }
    
    // MARK: - Coordinator Outputs
    public let selectedSchool$ = PublishSubject<School>()
    
    // MARK: - Transformation
    public func transform(inputs: Inputs) -> Outputs {
        
        // MARK: - Properties
        let _apiService = apiService
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker()
        
        // MARK: - Schools data source.
        let formattedSchools$ = inputs.initalLoad$
            .subscribeOn(BackgroundSchedular(qos: .userInitiated))
            .flatMapLatest {
                _apiService.fetchSchools()
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
            }
            .map { $0.schools.map(SchoolViewModel.init) }
            .share()
        
        // MARK: - Routes to school detail.
        inputs.selectedIndexPath$
            .withLatestFrom(formattedSchools$, resultSelector: { (idxPath: $0, schools: $1) })
            .map { $0.schools[$0.idxPath.row].school }
            .bind(to: selectedSchool$)
            .disposed(by: disposeBag)
        
        return (formattedSchools$: formattedSchools$.asDriverIgnoreError(),
                loading$: activityTracker.asDriver(),
                error$: errorTracker.asDriver())
    }
    
}

// MARK: - SchoolViewModel
/// Formatted representation of `School`.
public struct SchoolViewModel: Equatable {
    public let school: School
    public let nameText: String
    public let phoneNumberText: String
    public let fullAddressText: String
    
    public init(_ school: School) {
        self.school = school
        self.nameText = school.name
        self.fullAddressText = "\(school.address), \(school.city), \(school.state)"
        self.phoneNumberText = school.phoneNumber
    }
}

