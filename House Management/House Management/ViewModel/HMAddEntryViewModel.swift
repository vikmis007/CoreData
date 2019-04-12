//
//  HMAddEntryControllerViewModel.swift
//  House Management
//
//  Created by Vikasmishra on 11/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

class HMAddEntryViewModel {
    
    //DB Manager instance
    private let dbManager: HMAddEntryDBManager = HMAddEntryDBManager()
    
    var personDict: [String: Any] = [:]
    var houseDict: [String: Any] = [:]
    
    func savePersonData() {
        dbManager.addEntryToPersonDB(with: personDict)
    }
    
    func saveHouseData() {
        dbManager.addEntryToHouseDB(with: houseDict)
    }
    
}
