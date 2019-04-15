//
//  HMHouseListViewController.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

let HOUSE_LIST_TABLE_VIEW_CELL = "HMHouseListTableViewCell"
let HOUSE_LIST_TABLE_VIEW_CELL_IDENTIFIER = "HMHouseListTableViewCellIdentifier"

class HMHouseListViewController: UIViewController {
    
    //IBOutlets
    @IBOutlet weak var tableView: UITableView!
    
    //ViewModel instance
    private let viewModel = HMHouseListViewModel()
    
    //MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
    //MARK: - Life cycle methods
    private func configureTableview() {
        tableView.separatorStyle = .none
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: HOUSE_LIST_TABLE_VIEW_CELL, bundle: nil), forCellReuseIdentifier: HOUSE_LIST_TABLE_VIEW_CELL_IDENTIFIER)
    }
    
    private func loadData() {
        viewModel.loadHouseDataFromDB {
            tableView.reloadData()
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
        
        cell.updateHouseRecord(viewModel.aHouse[indexPath.row])
        
        return cell
    }
}

/// COnform to HMAddEntryViewControllerProtocol
extension HMHouseListViewController: HMAddEntryViewControllerProtocol {
    
    func didTapSaveBtn() {
        loadData()
    }
    
    func didTapCancelBtn() { }
}
