//
//  HMPersonDBManager.swift
//  House Management
//
//  Created by Vikasmishra on 12/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

class HMPersonDBManager {
    
    func fetchDataFromDB(completion: ([Person]?)->()) {
        CoreDataManager.shared.fetchDataFromDB(from: .person) { (result) in
            completion(result as? [Person])
        }
    }
    
    func deleteObject(_ person: Person, completion: (Bool)->()) {
        CoreDataManager.shared.deleteObject(with: .person, object: person) { (isDeleted) in
            completion(isDeleted)
        }
    }
}
