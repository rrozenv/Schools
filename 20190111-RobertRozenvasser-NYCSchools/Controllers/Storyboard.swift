//
//  Storyboard.swift
//  Hedge-iOS
//
//  Created by Robert Rozenvasser on 1/23/19.
//

import Library
import UIKit

public enum Storyboard {
    public static func instantiate<VC: UIViewController>(_ viewController: VC.Type,
                                                  inBundle bundle: Bundle = .main) -> VC {
        guard
            let vc = UIStoryboard(name: String(describing: viewController), bundle: nil)
                .instantiateViewController(withIdentifier: VC.storyboardIdentifier) as? VC
            else { fatalError("Couldn't instantiate \(VC.storyboardIdentifier)") }
        return vc
    }
}




