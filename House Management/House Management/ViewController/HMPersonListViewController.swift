//
//  HMPersonListViewController.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class HMPersonListViewController: UIViewController {

    //MARK: - Life cycle methods
    override func viewDidLoad() {
        
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HMConstants.kPersonListToAddPersonIdentifier {
            guard let addEntryViewController: HMAddEntryViewController = segue.destination as? HMAddEntryViewController
                else { return }
            addEntryViewController.delegate = self
            addEntryViewController.sourceController = .person
        }
    }
    
}

/// COnform to HMAddEntryViewControllerProtocol
extension HMPersonListViewController: HMAddEntryViewControllerProtocol {
    
    func didTapSaveBtn() { }
    
    func didTapCancelBtn() { }
}
