//
//  CoreDataManager.swift
//  House Management
//
//  Created by Vikasmishra on 11/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation
import UIKit
import CoreData

class CoreDataManager: NSObject {
    
    private static let manager: CoreDataManager = CoreDataManager()
    
    private let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    private override init() { }
    
    static var shared: CoreDataManager{
        return manager
    }
    
    func addPersonObjectToCoreData(_ dict: [String: Any]) {
        guard let context = managedObjectContext else {
            print("Context is not available")
            return
        }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "Person", in: context) else {
            print("Person entity not available")
            return
        }
        
        guard let person: Person = NSManagedObject(entity: entity, insertInto: context) as? Person else {
            print("Fatal error")
            return
        }
        
        person.name = dict[HMConstants.kName] as? String
        person.age = dict[HMConstants.kAge] as! Int32
        person.email = dict[HMConstants.kEmail] as? String
        person.mobile = dict[HMConstants.kMobile] as? String
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error saving person object")
        }
    }
    
    func addHouseObjectToCoreData(_ dict: [String: Any]) {
        guard let context = managedObjectContext else {
            print("Context is not available")
            return
        }
        
        guard let entity = NSEntityDescription.entity(forEntityName: "House", in: context) else {
            print("Person entity not available")
            return
        }
        
        guard let house: House = NSManagedObject(entity: entity, insertInto: context) as? House else {
            print("Fatal error")
            return
        }
        
        house.houseNo = dict[HMConstants.kHouseNo] as? String
        house.address = dict[HMConstants.kAddress] as? String
        house.landmark = dict[HMConstants.kLandmark] as? String
        house.locality = dict[HMConstants.kLocality] as? String
        house.pincode = dict[HMConstants.kPincode] as! Int32
        
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error saving person object")
        }
    }
}
