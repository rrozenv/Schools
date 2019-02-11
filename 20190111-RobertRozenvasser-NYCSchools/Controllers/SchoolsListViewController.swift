//
//  SchoolsListViewController.swift
//  20190111-RobertRozenvasser-NYCSchools
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import RxSwift
import RxCocoa
import Library
import Prelude
import Domain

final class SchoolsListViewController: RxViewController, BindableType {
    
    var viewModel: SchoolsListViewModel!
    
    // MARK: - Properties
    @IBOutlet weak var tableView: RxTableView!
    private let refreshControl = UIRefreshControl()
   
    // MARK: - Initalization
    static func instantiate() -> SchoolsListViewController {
        let vc = Storyboard.instantiate(SchoolsListViewController.self)
        let vm = SchoolsListViewModel()
        vc.setViewModelBinding(model: vm)
        return vc
    }
    
    deinit { debugPrint("\(type(of: self)) deinit") }
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(SchoolTableCell.self)
        tableView.addSubview(refreshControl)
    }
    
    // MARK: - Style Binding
    override func bindStyles() {
        super.bindStyles()
        _ = tableView |> baseTableStyle()
        setupNavigationBar()
    }
    
    // MARK: - View Model binding
    override func bindViewModel() {
        super.bindViewModel()
        
        /** MARK: - Inputs **/
        
        /// Triggers on pull to refresh.
        let refreshControl$ = refreshControl.rx.controlEvent(.valueChanged).map { _ in () }
        
        /// Combined inputs.
        let inputs = SchoolsListViewModel.Inputs(
            initalLoad$: Observable.merge(initalLoad$, refreshControl$),
            selectedIndexPath$: tableView.rx.itemSelected.asObservable()
        )
        
        /** MARK: - Outputs **/
        
        /// Combined outputs.
        let outputs = viewModel.transform(inputs: inputs)
        
        /// Displays schools in table view.
        outputs.formattedSchools$
            .drive(tableView.rx.items(cellIdentifier: SchoolTableCell.identifier, cellType: SchoolTableCell.self)) { _ , school, cell in
                cell.nameLabel.text = school.nameText
                cell.phoneLabel.text = school.phoneNumberText
                cell.addressLabel.text = school.fullAddressText
            }
            .disposed(by: disposeBag)
        
        /// Animates loading indicator.
        outputs.loading$
            .drive(refreshControl.rx.isRefreshing)
            .disposed(by: disposeBag)
        
        /// Displays error.
        outputs.error$
            .drive(rx.displayError)
            .disposed(by: disposeBag)
        
    }

    // MARK: - View Setup
    private func setupNavigationBar() {
        navigationItem.title = Strings.schools()
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
}
