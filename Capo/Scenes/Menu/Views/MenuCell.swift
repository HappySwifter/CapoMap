//
//  MenuCell.swift
//  Machine
//
//  Created by Артем Валиев on 04/08/2017.
//  Copyright © 2017 Артем Валиев. All rights reserved.
//

import Foundation
import UIKit

class MenuCell: UITableViewCell {
    
    var delegate: MenuCellVM?
    
    @IBOutlet weak var dividerView: UIView!
    @IBOutlet weak var iconView: UIImageView!
    @IBOutlet weak var label: UILabel!

    func configure(withDelegate delegate: MenuCellVM, isSelected: Bool) {
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        self.delegate = delegate
        label.text = delegate.text
        iconView.image = delegate.image


        label.textColor = .gray
        

        
        if delegate.showDivider {
            dividerView.isHidden = false
        } else {
            dividerView.isHidden = true
        }
    }

    
}
