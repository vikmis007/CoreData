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

enum HMDBEntityEnum {
    case person
    case house
}

class CoreDataManager: NSObject {
    
    private static let manager: CoreDataManager = CoreDataManager()
    
    private let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    
    private override init() { }
    
    static var shared: CoreDataManager{
        return manager
    }
    
    
    //MARK: - Method to delete data to DB
    func deleteObject(with type: HMDBEntityEnum, object: Any, completion: (Bool)->()) {
        
        guard let context = managedObjectContext else {
            print("Context is not available")
            return
        }
        
        if type == .person {
            if let obj = object as? Person {
                context.delete(obj)
            }
        } else {
            if let obj = object as? House {
                context.delete(obj)
            }
        }
        saveContext()
        completion(true)
    }
    
    //MARK: - Methods to fetch data to DB
    func fetchDataFromDB(from entity: HMDBEntityEnum, completion: ([NSManagedObject])->()) {
        
        guard let context = managedObjectContext else {
            print("Context is not available")
            return
        }
        
        let fetchRequest: NSFetchRequest<NSFetchRequestResult>?
        if entity == .person {
            fetchRequest = NSFetchRequest(entityName: "Person")
        } else {
            fetchRequest = NSFetchRequest(entityName: "House")
        }
        
        guard let _ = fetchRequest else {
            print("Error in forming fetch request")
            return
        }
        
        do {
            guard let result: [NSManagedObject] = try context.fetch(fetchRequest!) as? [NSManagedObject] else { return }
            completion(result)
        } catch {
            print("Fatal error")
        }
        
    }
    
    //MARK: - Methods to add data to DB
    func addObjectToDB(for entity: HMDBEntityEnum, dict: [String: Any]) {
        guard let context = managedObjectContext else {
            print("Context is not available")
            return
        }
        if entity == .house {
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
            house.pincode = dict[HMConstants.kPincode] as? Int32 ?? 0
            
        } else {
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
            person.house = dict[HMConstants.kHouse] as? House
        }
        
        saveContext()
    }
    
    private func saveContext() {
        do {
            try managedObjectContext?.save()
        } catch {
            print("Error saving person object")
        }
    }
}
