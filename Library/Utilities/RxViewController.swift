//
//  RxViewController.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/25/19.
//

import Foundation
import RxSwift
import RxCocoa

open class RxViewController: UIViewController {
    
    // MARK: - Properties
    public let disposeBag = DisposeBag()
    
    /// Called first time viewWillAppear(_:) is invoked.
    public lazy var initalLoad$ = rx.controllerLifecycleState()
        .filter { $0 == .willAppear }
        .asObservable()
        .take(1)
        .mapToVoid()
        .share()

    // MARK: View Model Binding
    /// Should override.
    open func bindViewModel() {
        initalLoad$
            .subscribe(onNext: { [weak self] in
                self?.bindStyles()
            })
            .disposed(by: disposeBag)
    }
    
    // MARK: Styles Binding
    /// Should override.
    open func bindStyles() { }
    
}

// MARK: - ControllerLifecycleState
public extension UIViewController {
    
    public enum ControllerLifecycleState {
        case unknown, didAppear, didDisappear, willAppear, willDisappear
    }
    
}

// MARK: - Reactive Extension ControllerLifecycleState
public extension Reactive where Base: UIViewController {
    
    private typealias _StateSelector = (Selector, UIViewController.ControllerLifecycleState)
    private typealias _State = UIViewController.ControllerLifecycleState
    
    private func observableAppearance(_ selector: Selector, state: _State) -> Observable<UIViewController.ControllerLifecycleState> {
        return (base as UIViewController).rx
            .methodInvoked(selector)
            .map { _ in state }
    }
    
    public func controllerLifecycleState() -> Driver<UIViewController.ControllerLifecycleState> {
        let statesAndSelectors: [_StateSelector] = [
            (#selector(UIViewController.viewDidAppear(_:)), .didAppear),
            (#selector(UIViewController.viewDidDisappear(_:)), .didDisappear),
            (#selector(UIViewController.viewWillAppear(_:)), .willAppear),
            (#selector(UIViewController.viewWillDisappear(_:)), .willDisappear)
        ]
        let observables = statesAndSelectors
            .map({ observableAppearance($0.0, state: $0.1) })
        return Observable
            .from(observables)
            .merge()
            .asDriver(onErrorJustReturn: UIViewController.ControllerLifecycleState.unknown)
            .startWith(UIViewController.ControllerLifecycleState.unknown)
            .distinctUntilChanged()
    }
    
}
