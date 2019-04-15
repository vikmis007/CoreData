//
//  HMHouseListViewModel.swift
//  House Management
//
//  Created by Vikasmishra on 15/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

class HMHouseListViewModel {
    
    //DBManager instance
    private let dbManager = HMHouseDBManager()
    
    //Array to hold array of House objects
    var aHouse: [House] = []
    
    func loadHouseDataFromDB(completion: ()->()) {
        dbManager.fetchDataFromDB { (houses) in
            guard let _ = houses else { return }
            aHouse = houses!
            completion()
        }
    }
}
