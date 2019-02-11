//
//  SchoolListViewModelTests.swift
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

class SchoolListViewModelTests: XCTestCase {

    var viewModel: SchoolsListViewModel!
    var apiService: MockNetworkService!
    var disposeBag = DisposeBag()
    
    // MARK: Inputs
    let initalLoad$ = PublishSubject<Void>()
    let selectedIndexPath$ = PublishSubject<IndexPath>()
    
    override func setUp() {
        super.setUp()
        apiService = MockNetworkService()
        viewModel = SchoolsListViewModel(apiService: apiService)
    }
    
    override func tearDown() {
        super.tearDown()
        disposeBag = DisposeBag()
    }
    
    @discardableResult
    private func createOutputs() -> SchoolsListViewModel.Outputs {
        let inputs = SchoolsListViewModel.Inputs(initalLoad$: initalLoad$,
                                                 selectedIndexPath$: selectedIndexPath$)
        return viewModel.transform(inputs: inputs)
    }
    
    func test_schools_display() {
        /// Given
        let testScheduler = TestScheduler(initialClock: 0)
        let observer = testScheduler.createObserver([SchoolViewModel].self)
        
        let outputs = createOutputs()
        outputs
            .formattedSchools$
            .asObservable()
            .subscribe(observer)
            .disposed(by: disposeBag)
        
        // When
        testScheduler.start()
        initalLoad$.onNext(())
        
        // Then
        let firstSchool = observer.events[0].value.element?[0]
        let secondSchool = observer.events[0].value.element?[1]
        XCTAssert(firstSchool?.nameText == "School One")
        XCTAssert(firstSchool?.fullAddressText == "100 Main St., New York, NY")
        XCTAssert(secondSchool?.nameText == "School Two")
        XCTAssert(secondSchool?.fullAddressText == "100 Main St., Boston, MA")
    }
    
    func test_loading() {
        /// Given
        let testScheduler = TestScheduler(initialClock: 0)
        let observer = testScheduler.createObserver(Bool.self)
        
        let outputs = createOutputs()
        outputs
            .loading$.asObservable()
            .skip(1) // Skip inital emit of `false` value
            .subscribe(observer)
            .disposed(by: disposeBag)
        
        /// When
        testScheduler.start()
        initalLoad$.onNext(())
        
        /// Then
        XCTAssert(observer.events.count == 2)
        XCTAssertTrue((observer.events.first?.value.element)!)
        XCTAssertFalse((observer.events.last?.value.element)!)
    }
    
    func test_error() {
        /// Given
        let service = MockNetworkService()
        service.error$.accept(NetworkError.serverFailed)
        viewModel = SchoolsListViewModel(apiService: service)

        let testScheduler = TestScheduler(initialClock: 0)
        let observer = testScheduler.createObserver(Error.self)

        let outputs = createOutputs()
        outputs
            .error$.asObservable()
            .subscribe(observer)
            .disposed(by: disposeBag)

        /// When
        testScheduler.start()
        initalLoad$.onNext(())

        /// Then
        XCTAssert((observer.events.first?.value.element as? NetworkError) != nil)
    }
    
}
