//
//  RxUIViewController+Ext.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/31/19.
//

import RxSwift
import RxCocoa

// MARK: Reactive Extension
extension Reactive where Base: UIViewController {
   
    /// Displays error.
    public var displayError: Binder<Error> {
        return Binder(base) { vc, error in
            guard vc.presentedViewController == nil else { return }
            vc.display(error: error)
        }
    }
    
    /// Dismiss view controller.
    public var dismiss: Binder<Void> {
        return Binder(base) { vc, _ in
            vc.dismiss(animated: true, completion: nil)
        }
    }
}
