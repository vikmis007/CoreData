//
//  HMHouseListViewController.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

enum HouseListSourceController {
    case allocate_house
    case allocated_house
}

let HOUSE_LIST_TABLE_VIEW_CELL = "HMHouseListTableViewCell"
let HOUSE_LIST_TABLE_VIEW_CELL_IDENTIFIER = "HMHouseListTableViewCellIdentifier"

protocol HMHouseListControllerProtocol: class {
    func didSelectHouse(_ house: House)
}

class HMHouseListViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var saveBtn: UIButton!
    
    //ViewModel instance
    private let viewModel = HMHouseListViewModel()
    
    //Source controller to reuse this controller
    var source: HouseListSourceController?
    
    //Array to hold list of house allocated to person
    var house: House?
    
    //Delegate var
    weak var delegate: HMHouseListControllerProtocol?
    
    //Private vars
    private var selectedRow: Int = -1
    
    //MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUIBasedOnSourceController()
        
        configureTableview()
        
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HMConstants.kHouseListToAddHouseIdentifier {
            guard let addEntryViewController: HMAddEntryViewController = segue.destination as? HMAddEntryViewController
                else { return }
            addEntryViewController.delegate = self
            addEntryViewController.sourceController = .house
        }
    }
    
    //MARK: - IBActions here
    @IBAction func saveBtnTapped(_ sender: Any) {
        if selectedRow >= 0 {
            let selectedHouse = viewModel.aHouse[selectedRow]
            self.dismiss(animated: true) {
                self.delegate?.didSelectHouse(selectedHouse)
            }
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    //MARK: - Life cycle methods
    private func configureTableview() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: HOUSE_LIST_TABLE_VIEW_CELL, bundle: nil), forCellReuseIdentifier: HOUSE_LIST_TABLE_VIEW_CELL_IDENTIFIER)
        
        let imageView = UIImageView(frame: view.frame)
        imageView.image = UIImage(named: "house_bg")
        imageView.layer.opacity = 0.4
        view.addSubview(imageView)
        view.bringSubviewToFront(tableView)
        view.bringSubviewToFront(saveBtn)
        tableView.backgroundColor = UIColor.clear
    }
    
    //MARK: - Private helper methods
    private func loadData() {
        if source == .allocated_house {
            viewModel.aHouse.append(house!)
        } else {
            viewModel.loadHouseDataFromDB {
                tableView.reloadData()
            }
        }
    }
    
    private func configureUIBasedOnSourceController() {
        if source == .allocate_house {
            saveBtn.isHidden = false
        } else {
            saveBtn.isHidden = true
        }
    }
}

//MARK: - Tableview datasource & delegate methods
extension HMHouseListViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.aHouse.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HMHouseListTableViewCell = tableView.dequeueReusableCell(withIdentifier: HOUSE_LIST_TABLE_VIEW_CELL_IDENTIFIER) as? HMHouseListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateHouseRecord(viewModel.aHouse[indexPath.row], source: source)
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let house = viewModel.aHouse[indexPath.row]
            viewModel.deleteObjectFromDB(house) { (isDeleted) in
                loadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //TODO: - Fix this method with proper delete action
        if source == .allocate_house {
            let cell: HMHouseListTableViewCell = tableView.cellForRow(at: indexPath) as! HMHouseListTableViewCell
            if cell.selectedStatuBtn.isSelected {
                selectedRow = -1
            } else {
                selectedRow = indexPath.row
            }
            cell.toggleStatusForSelectedButton()
            
        }
    }
}

/// COnform to HMAddEntryViewControllerProtocol
extension HMHouseListViewController: HMAddEntryViewControllerProtocol {
    
    func didTapSaveBtn() {
        loadData()
    }
    
    func didTapCancelBtn() { }
}
