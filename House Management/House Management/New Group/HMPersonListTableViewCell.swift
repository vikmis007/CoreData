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
    @IBOutlet weak var container: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
        configureCell()
    }
    
    private func configureCell() {
        selectionStyle = .none
        
        container.layer.borderWidth = 1.0
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.cornerRadius = 8
        
        container.layer.shadowColor = UIColor.darkGray.cgColor
        container.layer.shadowOpacity = 0.4
        container.layer.shadowOffset = CGSize(width: 5, height: 5)
        container.layer.shadowRadius = 8
    }
    
    func updateCellRecord(_ person: Person) {
        nameLabel.text = person.name
        ageLabel.text = "\(person.age) \(HMConstants.kAgeUnit)"
        emailLabel.text = person.email
        mobileLabel.text = person.mobile
    }
}
