//
//  UITableView+Ext.swift
//  Library
//
//  Created by Robert Rozenvasser on 1/25/19.
//

import Foundation

extension UITableView {
    
    public func register(_ cellClass: UITableViewCell.Type) {
        register(UINib(nibName: String(describing: cellClass.self), bundle: nil), forCellReuseIdentifier: cellClass.identifier)
    }
    
    public func dequeueReusableCell<CellClass: UITableViewCell>(of class: CellClass.Type, for indexPath: IndexPath, configure: ((CellClass) -> Void) = { _ in }) -> UITableViewCell {
        let cell = dequeueReusableCell(withIdentifier: CellClass.identifier, for: indexPath)
        if let typedCell = cell as? CellClass {
            configure(typedCell)
        }
        return cell
    }
    
}

extension UITableViewCell {
    public static var identifier: String { return String(describing: self) }
}

