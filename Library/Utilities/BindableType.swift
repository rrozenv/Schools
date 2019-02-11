//
//  BindableType.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/23/19.
//

import Foundation

public protocol BindableType: class {
    associatedtype ViewModel
    var viewModel: ViewModel! { get set }
    func bindViewModel()
}

extension BindableType where Self: UIViewController {
    public func setViewModelBinding(model: Self.ViewModel) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
