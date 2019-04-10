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
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: HMAddEntryViewControllerProtocol?
    var sourceController: AddEntrySourceViewControllerEnum?

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
    }
    
    //MARK: - Private helper methods
    private func configureTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: ENTRY_TABLE_VIEW_CELL, bundle: nil), forCellReuseIdentifier: ENTRY_TABLE_VIEW_CELL_IDENTIFIER)
        tableView.register(UINib(nibName: BUTTON_TABLE_VIEW_CELL, bundle: nil), forCellReuseIdentifier: BUTTON_TABLE_VIEW_CELL_IDENTIFIER)
    }
    
    //MARK: - IBActions here
    @IBAction func saveBtnTapped(_ sender: Any) {
        delegate?.didTapSaveBtn()
        
        defer {
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @IBAction func cancelBtnTapped(_ sender: Any) {
        delegate?.didTapCancelBtn()
        
        defer {
         self.dismiss(animated: true, completion: nil)
        }
    }
}

//MARK: - Tableview datasource & delegate methods
extension HMAddEntryViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch sourceController {
        case .person?:
            return 5
        case .house?:
            return 0
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: HMEntryTableViewCell = tableView.dequeueReusableCell(withIdentifier: ENTRY_TABLE_VIEW_CELL_IDENTIFIER) as? HMEntryTableViewCell else {
            return UITableViewCell()
        }
        
        cell.configureCell(with: "Test", textType: .email)
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
