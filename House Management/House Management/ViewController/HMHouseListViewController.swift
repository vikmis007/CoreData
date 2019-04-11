//
//  HMHouseListViewController.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class HMHouseListViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HMConstants.kHouseListToAddHouseIdentifier {
            guard let addEntryViewController: HMAddEntryViewController = segue.destination as? HMAddEntryViewController
                else { return }
            addEntryViewController.delegate = self
            addEntryViewController.sourceController = .house
        }
    }
}

/// COnform to HMAddEntryViewControllerProtocol
extension HMHouseListViewController: HMAddEntryViewControllerProtocol {
    
    func didTapSaveBtn() { }
    
    func didTapCancelBtn() { }
}
