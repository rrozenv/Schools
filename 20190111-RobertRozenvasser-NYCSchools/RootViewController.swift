//
//  RootViewController.swift
//  Hedge-iOS
//
//  Created by Robert Rozenvasser on 1/31/19.
//

import UIKit
import RxSwift
import Library
import Domain
import RxCocoa

// MARK: - RootViewController
/// Set as the rootViewController of main window.
/// Decides which root coordinator to display based on conditional logic (i.e. user is logged in/out)
class RootViewController: RxViewController {
    
    /// Root view controller of window.
    var current: UIViewController {
        didSet {
            remove(child: oldValue)
            add(child: current)
        }
    }
    
    // MARK: - Initalization
    static func instantiate() -> RootViewController {
        let vc = RootViewController()
        return vc
    }
    
    init() {
        current = UIViewController()
        super.init(nibName:  nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) { return nil }
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        current = HomeTabBarCoordinator()
    }
    
}
