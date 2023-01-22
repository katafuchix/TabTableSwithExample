//
//  TableViewCell+Extension.swift
//  TabTableSwithExample
//
//  Created by cano on 2023/01/22.
//

import UIKit

extension UITableViewCell {
    static func identifier() -> String {
        return String(describing: self)
    }
    
    @IBInspectable
    var selectedBackgroundColor: UIColor? {
        get {
            return selectedBackgroundView?.backgroundColor
        }
        set(color) {
            let background = UIView()
            background.backgroundColor = color
            selectedBackgroundView = background
        }
    }
}
