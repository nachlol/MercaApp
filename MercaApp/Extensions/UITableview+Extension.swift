//
//  UITableview+Extension.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 14/05/22.
//

import Foundation
import UIKit

extension UITableView {

    func setEmptyMessage(_ message: String,size: CGFloat) {
        let messageLabel = UILabel(frame: CGRect(x: 0, y: 0, width: self.bounds.size.width, height: self.bounds.size.height))
        messageLabel.text = message
        messageLabel.textColor = UIColor.init(named: "blackColor")
        messageLabel.numberOfLines = 0
        messageLabel.textAlignment = .center
        messageLabel.sizeToFit()
        messageLabel.font = UIFont(name: "Helvetica", size: size)
        messageLabel.backgroundColor = UIColor.systemGray6
        self.backgroundView = messageLabel
        self.separatorStyle = .none
    }

    func restore() {
        self.backgroundView = nil
        self.separatorStyle = .singleLine
    }
}
