//
//  HMHouseDBManager.swift
//  House Management
//
//  Created by Vikasmishra on 12/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

class HMHouseDBManager {
    
    func fetchDataFromDB(completion: ([House]?)->()) {
        CoreDataManager.shared.fetchDataFromDB(from: .house) { (result) in
            completion(result as? [House])
        }
    }
    
    func deleteObject(_ house: House, completion: (Bool)->()) {
        CoreDataManager.shared.deleteObject(with: .house, object: house) { (isDeleted) in
            completion(isDeleted)
        }
    }
    
}
