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
    case number
    case email
    case mobile
}

protocol HMEntryTableViewCellProtocol: class {
    func textfieldDidChangeTextFor(tag: Int, text: String)
}

class HMEntryTableViewCell: UITableViewCell {
    
    var textfieldType: HMEntryTableViewCellEnum = .text
    
    weak var delegate: HMEntryTableViewCellProtocol?
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var entryTextfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        selectionStyle = .none
    }
    
    func configureCell(with title: String, tag: Int, textType: HMEntryTableViewCellEnum) {
        titleLabel.text = title
        
        switch textType {
            case .text:
                entryTextfield.keyboardType = .default
                entryTextfield.autocapitalizationType = .words
            case .number:
                entryTextfield.keyboardType = .numberPad
            case .email:
                entryTextfield.keyboardType = .emailAddress
            case .mobile:
                entryTextfield.keyboardType = .phonePad
        }
        entryTextfield.delegate = self
        entryTextfield.autocorrectionType = .no
        entryTextfield.tag = tag
    }
    
}

///MARK: - Textfield Delegate method
extension HMEntryTableViewCell: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        delegate?.textfieldDidChangeTextFor(tag: textField.tag, text: textField.text!)
    }
}

///MARK: - Extension methods for HMEntryTableViewCell
extension HMEntryTableViewCell {
    func setupAddPersonEntryCell(with indexPath: IndexPath?) {
        guard let index = indexPath else { return }
        
        switch index.row {
        case 0:
            self.configureCell(with: HMConstants.kFullNameLabel, tag: 1, textType: .text)
        case 1:
            self.configureCell(with: HMConstants.kAgeLabel, tag: 2, textType: .number)
        case 2:
            self.configureCell(with: HMConstants.kEmailLabel, tag: 3, textType: .email)
        case 3:
            self.configureCell(with: HMConstants.kMobileLabel, tag: 4, textType: .mobile)
        default:
            return
        }
    }
    
    func setUpAllotHouseCell(with indexPath: IndexPath?) {
        
    }
    
    func setupAddHouseEntryCell(with indexPath: IndexPath?) {
        guard let index = indexPath else { return }
        
        switch index.row {
        case 0:
            self.configureCell(with: HMConstants.kHouseNoLabel, tag: 1, textType: .text)
        case 1:
            self.configureCell(with: HMConstants.kHouseAddressLabel, tag: 2, textType: .text)
        case 2:
            self.configureCell(with: HMConstants.kHouseLandmarkLabel, tag: 3, textType: .text)
        case 3:
            self.configureCell(with: HMConstants.kHouseLocalityLabel, tag: 4, textType: .text)
        case 4:
            self.configureCell(with: HMConstants.kHousePincodeLabel, tag: 5, textType: .number)
        default:
            return
        }
    }
}
