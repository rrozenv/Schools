//
//  SchoolDetailViewController.swift
//  20190111-RobertRozenvasser-NYCSchools
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import Library
import Prelude
import Domain

final class SchoolDetailViewController: RxViewController, BindableType {
    
    var viewModel: SchoolDetailViewModel!
    
    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var criticalReadingScoreLabel: UILabel!
    @IBOutlet weak var mathScoreLabel: UILabel!
    @IBOutlet weak var writingScoreLabel: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // MARK: - Initalization
    static func instantiate(school: School) -> SchoolDetailViewController {
        let vc = Storyboard.instantiate(SchoolDetailViewController.self)
        let vm = SchoolDetailViewModel(school: school)
        vc.setViewModelBinding(model: vm)
        return vc
    }
    
    deinit { debugPrint("\(type(of: self)) deinit") }
    
    // MARK: - Navigation Item
    override var navigationItem: UINavigationItem { return navItem }
    
    private lazy var navItem: UINavigationItem = {
        let navItem = UINavigationItem()
        navItem.largeTitleDisplayMode = .never
        return navItem
    }()
    
    // MARK: - Style Binding
    override func bindStyles() {
        super.bindStyles()
        _ = nameLabel |> baseHeadlineStyle
        _ = criticalReadingScoreLabel |> baseSubheadStyle
        _ = mathScoreLabel |> baseSubheadStyle
        _ = writingScoreLabel |> baseSubheadStyle
    }
    
    // MARK: - View Model binding
    override func bindViewModel() {
        super.bindViewModel()
        
        /** MARK: - Outputs **/
        let outputs = viewModel.transform(initalLoad$: initalLoad$)
        
        /// Displays school details.
        outputs.formattedSchoolDetails$
            .drive(onNext: { [weak self] details in
                self?.nameLabel.text = details.nameText
                self?.criticalReadingScoreLabel.text = details.readingScoreText
                self?.mathScoreLabel.text = details.mathScoreText
                self?.writingScoreLabel.text = details.writingScoreText
            })
            .disposed(by: disposeBag)

        /// Animates loading indicator.
        outputs.loading$
            .drive(activityIndicator.rx.isAnimating)
            .disposed(by: disposeBag)

        /// Displays error.
        outputs.error$
            .drive(rx.displayError)
            .disposed(by: disposeBag)
    }
    
}
