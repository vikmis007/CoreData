//
//  HMHouseListTableViewCell.swift
//  House Management
//
//  Created by Vikasmishra on 15/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class HMHouseListTableViewCell: UITableViewCell {

    
    @IBOutlet weak var container: UIView!
    @IBOutlet weak var houseNoLabel: UILabel!
    @IBOutlet weak var pincodeLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var landmarkLabel: UILabel!
    @IBOutlet weak var localityLabel: UILabel!
    @IBOutlet weak var selectedStatuBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        configureCell()
    }
    
    private func configureCell() {
        selectionStyle = .none
        selectedStatuBtn.isUserInteractionEnabled = false
        
        container.layer.borderColor = UIColor.lightGray.cgColor
        container.layer.borderWidth = 1.0
        container.layer.cornerRadius = 8.0
        
        container.layer.shadowColor = UIColor.darkGray.cgColor
        container.layer.shadowOpacity = 0.4
        container.layer.shadowOffset = CGSize(width: 5, height: 5)
        container.layer.shadowRadius = 8.0
    }
    
    func updateHouseRecord(_ house: House, source: HouseListSourceController?) {
        houseNoLabel.text = house.houseNo
        pincodeLabel.text = String(house.pincode)
        addressLabel.text = house.address
        landmarkLabel.text = house.landmark
        localityLabel.text = house.locality
        
        if source == .allocate_house {
            selectedStatuBtn.isHidden = false
        } else {
            selectedStatuBtn.isHidden = true
        }
    }
    
    func toggleStatusForSelectedButton() {
        selectedStatuBtn.isSelected = !selectedStatuBtn.isSelected
    }
    
}
