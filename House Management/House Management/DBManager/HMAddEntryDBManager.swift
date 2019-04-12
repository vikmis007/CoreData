//
//  HMAddEntryDBManager.swift
//  House Management
//
//  Created by Vikasmishra on 12/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

class HMAddEntryDBManager {
    
    func addEntryToPersonDB(with personDict: [String: Any]) {
        CoreDataManager.shared.addObjectToDB(for: .person, dict: personDict)
    }
    
    func addEntryToHouseDB(with houseDict: [String: Any]) {
        CoreDataManager.shared.addObjectToDB(for: .house, dict: houseDict)
    }
}
