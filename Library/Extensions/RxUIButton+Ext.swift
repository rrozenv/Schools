//
//  RxUIButton+Ext.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/8/19.
//

import RxSwift
import RxCocoa

// MARK: Reactive Extension
extension Reactive where Base: UIButton {
    public var isAlphaEnabled: Binder<Bool> {
        return Binder(base) { view, isValid in
            view.alpha = isValid ? 1.0 : 0.5
            view.isEnabled = isValid
        }
    }
}
