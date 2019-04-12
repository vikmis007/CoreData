//
//  HMPersonListTableViewCell.swift
//  House Management
//
//  Created by Vikasmishra on 12/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class HMPersonListTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var mobileLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell() {
        selectionStyle = .none
        
        //layer.borderWidth = 1.0
        layer.borderColor = UIColor.lightGray.cgColor
        layer.cornerRadius = 8
        
        layer.shadowColor = UIColor.darkGray.cgColor
        layer.shadowOpacity = 0.8
        layer.shadowOffset = CGSize(width: 8, height: 8)
        layer.shadowRadius = 8
    }
    
    func updateCellRecord(_ person: Person) {
        nameLabel.text = person.name
        ageLabel.text = "\(person.age) \(HMConstants.kAgeUnit)"
        emailLabel.text = person.email
        mobileLabel.text = person.mobile
    }
}
