//
//  HMPersonDetailViewController.swift
//  House Management
//
//  Created by Vikasmishra on 24/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

class HMPersonDetailViewController: UIViewController {
    
    //IBOutlets here
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ageLabel: UILabel!
    @IBOutlet weak var contactLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var alottedHouseBtn: UIButton!
    
    //View Model instance
    private var viewModel: HMPersonDetailViewModel!
    
    //Person object to be injected
    var person: Person?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initialSetup()
    }
    
    //MAR: - IBActions goes here
    @IBAction func showAllocatedHouseBtnTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: HMConstants.kMainStoryboardName, bundle: nil)
        let houseListVC: HMHouseListViewController = storyboard.instantiateViewController(withIdentifier: HOUSE_LIST_CONTROLLER_IDENTIFIER) as! HMHouseListViewController
        houseListVC.source = .allocated_house
        houseListVC.house = viewModel.person?.house
        navigationController?.show(houseListVC, sender: nil)
    }
    //Initial setup for view controller
    func initialSetup() {
        
        //Instantiate view model
        viewModel = HMPersonDetailViewModel(person: person)
        
        //Update UI with current data
        updateDataOnUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //UI Setup
        configureUI()
    }
    
    func configureUI() {
        profileImageView.layer.borderColor = UIColor.white.cgColor
        profileImageView.layer.borderWidth = 5.0
        profileImageView.layer.cornerRadius = max(profileImageView.frame.size.height, profileImageView.frame.size.width)/2
        profileImageView.clipsToBounds = true

        alottedHouseBtn.layer.borderColor = UIColor.lightGray.cgColor
        alottedHouseBtn.layer.borderWidth = 1.0
        alottedHouseBtn.layer.cornerRadius = 8.0
        alottedHouseBtn.layer.masksToBounds = true
    }
    
    //Update data for the current object
    func updateDataOnUI() {
        nameLabel.text = viewModel.person?.name
        ageLabel.text = "\(viewModel.person?.age ?? 0)"
        contactLabel.text = viewModel.person?.mobile
        emailLabel.text = viewModel.person?.email
    }

}
