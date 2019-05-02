//
//  HMButtonTableViewCell.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class HMButtonTableViewCell: UITableViewCell {

    @IBOutlet weak var customBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backgroundColor = UIColor.clear
    }
    
}
