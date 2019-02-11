//
//  SchoolsCoordinator.swift
//  20190111-RobertRozenvasser-NYCSchools
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Library
import RxSwift
import Domain

final class SchoolsCoordinator: UIViewController {
    
    // MARK: - Properties
    private let disposeBag = DisposeBag()
    private let navController = UINavigationController()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        // Sets root view controller of navController.
        navigateToSchoolsList()
        
        // Adds nav controller as child.
        add(child: navController)
    }

}

// MARK: - Navigation
extension SchoolsCoordinator {
    
    /// Schools List (ROOT)
    private func navigateToSchoolsList() {
        let vc = SchoolsListViewController.instantiate()
        
        /// Routes to school detail.
        vc.viewModel.selectedSchool$
            .subscribe(onNext: { [weak self] school in
                self?.navigateToSchoolDetail(for: school)
            })
            .disposed(by: disposeBag)
        
        navController.show(vc, sender: self)
    }
    
    /// School Detail
    private func navigateToSchoolDetail(for school: School) {
        let vc = SchoolDetailViewController.instantiate(school: school)
        navController.show(vc, sender: self)
    }
    
}
