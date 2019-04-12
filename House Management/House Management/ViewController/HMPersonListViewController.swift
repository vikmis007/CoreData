//
//  HMPersonListViewController.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import UIKit

let PERSON_LIST_TABLE_VIEW_CELL = "HMPersonListTableViewCell"
let PERSON_LIST_TABLE_VIEW_CELL_IDENTIFIER = "HMPersonListTableViewCellIdentifier"


class HMPersonListViewController: UIViewController {

    //IBOutlets here
    @IBOutlet weak var tableView: UITableView!
    
    ///View Model instance
    private let viewModel: HMPersonListViewModel = HMPersonListViewModel()
    
    //MARK: - Life cycle methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        
        loadData()
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == HMConstants.kPersonListToAddPersonIdentifier {
            guard let addEntryViewController: HMAddEntryViewController = segue.destination as? HMAddEntryViewController
                else { return }
            addEntryViewController.delegate = self
            addEntryViewController.sourceController = .person
        }
    }
    
    //MARK: - Private helper methods
    private func configureTableView() {
        tableView.register(UINib(nibName: PERSON_LIST_TABLE_VIEW_CELL, bundle: nil), forCellReuseIdentifier: PERSON_LIST_TABLE_VIEW_CELL_IDENTIFIER)
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func loadData() {
        viewModel.loadPersonsDataFromDB {
            tableView.reloadData()
        }
    }
    
}

//MARK: - Tableview datasource & delegate methods
extension HMPersonListViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.aPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HMPersonListTableViewCell = tableView.dequeueReusableCell(withIdentifier: PERSON_LIST_TABLE_VIEW_CELL_IDENTIFIER) as? HMPersonListTableViewCell else {
            return UITableViewCell()
        }
        
        cell.updateCellRecord(viewModel.aPerson[indexPath.row])
        
        return cell
    }
}

//MARK: - Conform to HMAddEntryViewControllerProtocol
extension HMPersonListViewController: HMAddEntryViewControllerProtocol {
    
    func didTapSaveBtn() { }
    
    func didTapCancelBtn() { }
}
