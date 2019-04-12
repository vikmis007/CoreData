//
//  HMAddEntryViewController.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

let ENTRY_TABLE_VIEW_CELL = "HMEntryTableViewCell"
let ENTRY_TABLE_VIEW_CELL_IDENTIFIER = "HMEntryTableViewCellIdentifier"
let BUTTON_TABLE_VIEW_CELL = "HMButtonTableViewCell"
let BUTTON_TABLE_VIEW_CELL_IDENTIFIER = "HMButtonTableViewCellIdentifier"


enum AddEntrySourceViewControllerEnum: String{
    case person
    case house
}

protocol HMAddEntryViewControllerProtocol: class {
    
    func didTapSaveBtn()
    
    func didTapCancelBtn()
}

class HMAddEntryViewController: UIViewController {
    
    ///UITableview IBOutlet
    @IBOutlet weak var tableView: UITableView!
    
    //View Model instance
    private let viewModel: HMAddEntryViewModel = HMAddEntryViewModel()
    
    ///DI Property
    weak var delegate: HMAddEntryViewControllerProtocol?
    var sourceController: AddEntrySourceViewControllerEnum!
    
    //MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
    }
    
    //MARK: - IBActions here
    @IBAction func saveBtnTapped(_ sender: Any) {
        
        view.endEditing(true)
        
        if sourceController == .person {
            viewModel.savePersonData()
        } else {
            viewModel.saveHouseData()
        }
        
        delegate?.didTapSaveBtn()
        
        defer {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        delegate?.didTapCancelBtn()
        
        defer {
            view.resignFirstResponder()
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Private helper methods
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: ENTRY_TABLE_VIEW_CELL, bundle: nil), forCellReuseIdentifier: ENTRY_TABLE_VIEW_CELL_IDENTIFIER)
        tableView.register(UINib(nibName: BUTTON_TABLE_VIEW_CELL, bundle: nil), forCellReuseIdentifier: BUTTON_TABLE_VIEW_CELL_IDENTIFIER)
    }
    
    private func updatePersonDict(tag: Int, text: String) {
        switch tag {
        case 1:
            viewModel.personDict[HMConstants.kName] = text
        case 2:
            viewModel.personDict[HMConstants.kAge] = Int32(text) ?? 0
        case 3:
            viewModel.personDict[HMConstants.kEmail] = text
        case 4:
            viewModel.personDict[HMConstants.kMobile] = text
        default:
            return
        }
    }
    
    private func updateHouseDict(tag: Int, text: String) {
        switch tag {
        case 1:
            viewModel.houseDict[HMConstants.kHouseNo] = text
        case 2:
            viewModel.houseDict[HMConstants.kAddress] = text
        case 3:
            viewModel.houseDict[HMConstants.kLandmark] = text
        case 4:
            viewModel.houseDict[HMConstants.kLocality] = text
        case 5:
            viewModel.houseDict[HMConstants.kPincode] = Int32(text)
        default:
            return
        }
    }
    
    
}

//MARK: - HMEntryTableViewCell delegate methods
extension HMAddEntryViewController: HMEntryTableViewCellProtocol {
    func textfieldDidChangeTextFor(tag: Int, text: String) {
        if sourceController == .person {
            updatePersonDict(tag: tag, text: text)
        } else {
            updateHouseDict(tag: tag, text: text)
        }
    }
}

//MARK: - Tableview datasource & delegate methods
extension HMAddEntryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sourceController {
        case .person?:
            return 4
        case .house?:
            return 5
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HMEntryTableViewCell = tableView.dequeueReusableCell(withIdentifier: ENTRY_TABLE_VIEW_CELL_IDENTIFIER) as? HMEntryTableViewCell else {
            return UITableViewCell()
        }
        cell.delegate = self
        if(sourceController == .person) {
           cell.setupAddPersonEntryCell(with: indexPath)
        } else {
            cell.setupAddHouseEntryCell(with: indexPath)
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
}
