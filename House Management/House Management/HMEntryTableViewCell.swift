//
//  HMEntryTableViewCell.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

enum HMEntryTableViewCellEnum: String {
    case text
    case email
    case mobile
}

class HMEntryTableViewCell: UITableViewCell {

    var textfieldType: HMEntryTableViewCellEnum = .text
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var entryTextfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configureCell(with title: String, textType: HMEntryTableViewCellEnum) {
        titleLabel.text = title
        
        switch textType {
        case .text:
            entryTextfield.keyboardType = .default
        case .email:
            entryTextfield.keyboardType = .emailAddress
        case .mobile:
            entryTextfield.keyboardType = .phonePad
        }
    }
    
}
