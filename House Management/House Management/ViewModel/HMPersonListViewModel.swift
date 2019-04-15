//
//  HMPersonListViewModel.swift
//  House Management
//
//  Created by Vikasmishra on 12/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

class HMPersonListViewModel {
    
    ///DB Manager instance
    private let dbManager: HMPersonDBManager = HMPersonDBManager()
    
    /// Array to hold results from person entity
    var aPerson: [Person] = []
    
    /// This method will load array of Persons from DB
    func loadPersonsDataFromDB(completion: ()->()) {
        dbManager.fetchDataFromDB { (persons) in
            guard let _ = persons else { return }
            aPerson = persons!
            completion()
        }
    }
    
    func deleteObjectFromDB(_ person: Person, compeletion: (Bool)->()) {
        dbManager.deleteObject(person) { (isDeleted) in
            compeletion(isDeleted)
        }
    }
    
}
