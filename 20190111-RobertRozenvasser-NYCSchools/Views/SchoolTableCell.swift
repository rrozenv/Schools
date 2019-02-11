//
//  SchoolTableCell.swift
//  20190111-RobertRozenvasser-NYCSchools
//
//  Created by Robert Rozenvasser on 2/11/19.
//  Copyright © 2019 Cluk Labs. All rights reserved.
//

import Library
import UIKit
import Prelude

final class SchoolTableCell: UITableViewCell {
    
    // MARK: - Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    override func bindStyles() {
        super.bindStyles()
        _ = self |> baseTableCellStye
        _ = nameLabel |> baseHeadlineStyle
        _ = addressLabel |> baseSubheadStyle
    }
    
}
