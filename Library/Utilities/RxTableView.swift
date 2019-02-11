//
//  RxTableView.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/7/19.
//

import UIKit
import RxSwift

public class RxTableView: UITableView {
    
    private let disposeBag = DisposeBag()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        tableFooterView = UIView()
        
        rx.itemSelected.asObservable()
            .subscribe(onNext: { [weak self] in
                self?.deselectRow(at: $0, animated: true)
            })
            .disposed(by: disposeBag)
    }
    
}
