//
//  HMConstants.swift
//  House Management
//
//  Created by Vikasmishra on 10/04/19.
//  Copyright © 2019 Exercise. All rights reserved.
//

import Foundation

struct HMConstants {
    
    //MARK: - UI Related Constant
    
    ///Person related labels
    static let kFullNameLabel = "Full Name"
    static let kMobileLabel = "Mobile No"
    static let kEmailLabel = "Email Id"
    static let kAgeLabel = "Age"
    
    ///House related labels
    static let kHouseNoLabel = "House No"
    static let kHouseAddressLabel = "Address"
    static let kHouseLandmarkLabel = "Landmark"
    static let kHouseLocalityLabel = "Locality"
    static let kHousePincodeLabel = "Pincode"
    
    ///Person related constant
    static let kName = "name"
    static let kAge = "age"
    static let kEmail = "email"
    static let kMobile = "mobile"
    static let kHouse = "house"
    static let kAgeUnit = "Yrs"
    
    ///House related constant
    static let kHouseNo = "houseNo"
    static let kAddress = "address"
    static let kLandmark = "landmark"
    static let kLocality = "locality"
    static let kPincode = "pincode"
    
    
    ///Segue constants
    static let kHouseListToAddHouseIdentifier = "HouseListToAddHouseIdentifier"
    static let kPersonListToAddPersonIdentifier = "PersonListToAddPersonIdentifier"
    
    ///Storyboard name
    static let kMainStoryboardName = "Main"
    static let kLaunchStoryboardName = "LaunchScreen"
    
    //Alert button constant
    static let kOKTitle = "OK"
    
    ///Validation Error messages
    static let kNameFieldEmptyMessage = "Name can't be empty!!"
    static let kAgeFieldEmptyMessage = "Age can't be empty!!"
    static let kAgeFieldInvalidMessage = "Invalid Age !!"
    static let kEmailFieldEmptyMessage = "Email can't be empty!!"
    static let kContactFieldEmptyMessage = "Contact can't be empty!!"
    
    static let kHouseNoEmptyMessage = "House No can't be empty!!"
    static let kAddressEmptyMessage = "Address can't be empty!!"
    static let kLocalityEmptyMessage = "Locality can't be empty!!"
    static let kPincodeEmptyMessage = "Pincode can't be empty!!"
    static let kPincodeInvalidMessage = "Invalid Pincode!!"
    
}
