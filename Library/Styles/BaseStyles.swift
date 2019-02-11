//
//  BaseStyles.swift
//  Library
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Foundation
import Prelude

/// Base view controller style.
public let baseTableCellStye =
    UITableViewCell.lens.preservesSuperviewLayoutMargins .~ false
        <> UITableViewCell.lens.layoutMargins .~ .zero
        <> UITableViewCell.lens.separatorInset .~ .zero

/// Base table view style.
public func baseTableStyle <TVC: UITableView>
    (estimatedRowHeight: CGFloat = 44.0) -> ((TVC) -> TVC) {
    return TVC.lens.backgroundColor .~ .white
        <> TVC.lens.rowHeight .~ UITableView.automaticDimension
        <> TVC.lens.estimatedRowHeight .~ estimatedRowHeight
        <> TVC.lens.separatorStyle .~ .singleLine
        <> TVC.lens.separatorColor .~ .lightGray
        <> TVC.lens.layoutMargins .~ .zero
}

/// Base text headline style.
public let baseHeadlineStyle =
    UILabel.lens.textColor .~ Theme.current.primaryTextColor
        <> UILabel.lens.font .~ UIFont.headline().bolded

/// Base text subtitle style.
public let baseSubheadStyle =
    UILabel.lens.textColor .~ Theme.current.secondaryTextColor
        <> UILabel.lens.font .~ UIFont.subhead()

/// Base text caption style.
public let baseCaptionStyle =
    UILabel.lens.textColor .~ Theme.current.secondaryTextColor
        <> UILabel.lens.font .~ UIFont.caption1()

