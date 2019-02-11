//
//  SchoolDetailViewModel.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import RxSwift
import RxCocoa
import RxCocoa
import Domain

public class SchoolDetailViewModel {
    
    // MARK: - Outputs
    public typealias Outputs = (
        formattedSchoolDetails$: Driver<SchoolDetailsViewModel>,
        loading$: Driver<Bool>,
        error$: Driver<Error>
    )
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let school$: BehaviorRelay<School>
    private let apiService: SchoolsUseCase
    
    // MARK: - Initalization
    public init(school: School,
                apiService: SchoolsUseCase = App.apiService) {
        self.school$ = BehaviorRelay(value: school)
        self.apiService = apiService
    }
    
    // MARK: - Transformation
    public func transform(initalLoad$: Observable<Void>) -> Outputs {
        // MARK: - Properties
        let _apiService = apiService
        let errorTracker = ErrorTracker()
        let activityTracker = ActivityTracker()
        
        // MARK: - Formatted School Details
        let formattedSchool$ = initalLoad$
            .subscribeOn(BackgroundSchedular(qos: .userInitiated))
            .withLatestFrom(school$)
            .flatMapLatest {
                _apiService.fetchSchoolDetails(for: $0)
                    .trackActivity(activityTracker)
                    .trackError(errorTracker)
            }
            .map(SchoolDetailsViewModel.init)
        
        return (
            formattedSchoolDetails$: formattedSchool$.asDriverIgnoreError(),
            loading$: activityTracker.asDriver(),
            error$: errorTracker.asDriver()
        )
    }
    
}

// MARK: - SchoolDetailsViewModel
/// Formatted representation of `SchoolDetails`
public struct SchoolDetailsViewModel: Equatable {
    public let schoolDetails: SchoolDetails
    public let nameText: String
    public let readingScoreText: String
    public let mathScoreText: String
    public let writingScoreText: String
    
    public init(_ schoolDetails: SchoolDetails) {
        self.schoolDetails = schoolDetails
        self.nameText = schoolDetails.name.lowercased().capitalized
        self.readingScoreText = Strings.avg_reading_score(score: schoolDetails.avgCriticalReadingScore)
        self.mathScoreText = Strings.avg_math_score(score: schoolDetails.avgMathScore)
        self.writingScoreText = Strings.avg_writing_score(score: schoolDetails.avgWritingScore)
    }
}

// MARK: - SchoolDetailError
public enum SchoolDetailError: Error {
    case schoolNotFound
}

extension SchoolDetailError: LocalizedError {
    public var errorDescription: String? {
        return Strings.school_not_found()
    }
}

