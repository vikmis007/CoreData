//
//  HMAddEntryControllerViewModel.swift
//  House Management
//
//  Created by Vikasmishra on 11/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

class HMAddEntryControllerViewModel {
    
    var personDict: [String: Any] = [:]
    var houseDict: [String: Any] = [:]
    
    func addEntryToPersonDB() {
        CoreDataManager.shared.addPersonObjectToCoreData(personDict)
    }
    
    func addEntryToHouseDB() {
        CoreDataManager.shared.addHouseObjectToCoreData(houseDict)
    }
    
}
