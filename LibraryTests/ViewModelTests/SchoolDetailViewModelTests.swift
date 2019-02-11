//
//  SchoolDetailViewModelTests.swift
//  LibraryTests
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import XCTest
import RxSwift
import RxCocoa
import Prelude
import RxTest
import RxBlocking
@testable import Library
@testable import Domain

class SchoolDetailViewModelTests: XCTestCase {

    var viewModel: SchoolDetailViewModel!
    var apiService: MockNetworkService!
    var disposeBag = DisposeBag()
    
    // MARK: Inputs
    var initalLoad$: PublishSubject<Void>!
    
    override func setUp() {
        super.setUp()
        apiService = MockNetworkService()
        viewModel = SchoolDetailViewModel(school: School.template, apiService: apiService)
        initalLoad$ = PublishSubject<Void>()
    }
    
    override func tearDown() {
        super.tearDown()
        disposeBag = DisposeBag()
    }
    
    @discardableResult
    private func createOutputs() -> SchoolDetailViewModel.Outputs {
        return viewModel.transform(initalLoad$: initalLoad$.asObservable())
    }
    
    func test_school_details_display() {
        /// Given
        let testScheduler = TestScheduler(initialClock: 0)
        let observer = testScheduler.createObserver(SchoolDetailsViewModel.self)
        
        let outputs = createOutputs()
        outputs
            .formattedSchoolDetails$
            .asObservable()
            .subscribe(observer)
            .disposed(by: disposeBag)
        
        // When
        testScheduler.start()
        initalLoad$.onNext(())
        
        // Then
        let schoolDetails = observer.events[0].value.element
        XCTAssert(schoolDetails?.nameText == "School One")
        XCTAssert(schoolDetails?.readingScoreText == Strings.avg_reading_score(score: "700"))
        XCTAssert(schoolDetails?.mathScoreText == Strings.avg_math_score(score: "750"))
        XCTAssert(schoolDetails?.writingScoreText == Strings.avg_writing_score(score: "800"))
    }
    
}
