//
//  HomeTabBarCoordinator.swift
//  20190111-RobertRozenvasser-NYCSchools
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import UIKit
import RxSwift
import Library
import Domain

final class HomeTabBarCoordinator: UIViewController {
    
    // MARK: - Properties
    private let tabController = UITabBarController()
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Set tab bar view controllers.
        tabController.viewControllers = [
            createSchoolsCoordinator(),
        ]
        
        // Add tab bar as child.
        add(child: tabController)
    }

}

// MARK: - Navigation
extension HomeTabBarCoordinator {
    
    /// Creates `SchoolsCoordinator`
    private func createSchoolsCoordinator() -> UIViewController {
        let schoolsCoordinator = SchoolsCoordinator()
        schoolsCoordinator.tabBarItem = UITabBarItem(tabBarSystemItem: .bookmarks, tag: 0)
        return schoolsCoordinator
    }
    
}
