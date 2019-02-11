//
//  UIViewController+Ext.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/25/19.
//

import UIKit

extension UIViewController {
    public static var defaultNib: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
    
    public static var storyboardIdentifier: String {
        return self.description().components(separatedBy: ".").dropFirst().joined(separator: ".")
    }
}

extension UIViewController {
    
    public func add(child viewController: UIViewController, frame: CGRect? = nil) {
        addChild(viewController)
        viewController.view.frame = frame ?? view.bounds
        view.addSubview(viewController.view)
        viewController.didMove(toParent: self)
    }
    
    public func remove(child viewController: UIViewController) {
        viewController.willMove(toParent: nil)
        viewController.view.removeFromSuperview()
        viewController.removeFromParent()
    }
    
    public func animateFadeTransition(to new: UIViewController, from previous: UIViewController) {
        previous.willMove(toParent: nil)
        addChild(new)
        transition(from: previous, to: new, duration: 0.3, options: [.transitionCrossDissolve, .curveEaseOut], animations: {
            
        }) { completed in
            previous.removeFromParent()
            new.didMove(toParent: self)
        }
    }
    
}

extension UIViewController {
    
    public func display(error: Error) {
        let alertVc = UIAlertController(title: nil, message: nil, preferredStyle: .alert)
        alertVc.addAction(UIAlertAction.init(title: "Ok", style: .cancel))
        
        if let networkError = error as? NetworkError {
            switch networkError {
            case .serverFailed:
                alertVc.title = "Server Failed"
                alertVc.message = "Check your network connection and try again."
            case .serverError(let customError, let statusCode):
                if let customError = customError {
                    alertVc.title = "\(statusCode) Error"
                    alertVc.message = customError.localizedDescription
                }
            case .decodingError(let message):
                alertVc.title = "Decoding Error"
                alertVc.message = message
            }
        } else {
            alertVc.title = "Error"
            alertVc.message = error.localizedDescription
        }
        
        DispatchQueue.main.async {
            self.present(alertVc, animated: true, completion: nil)
        }
    }
    
}

