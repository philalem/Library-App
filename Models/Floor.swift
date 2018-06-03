//
//  Floor.swift
//  Library App
//
//  Created by Phillip LeMaster on 5/28/18.
//  Copyright © 2018 Phillip LeMaster. All rights reserved.
//

import Foundation
import RealmSwift

//used for user to enter crowd level entry
class Floor: Object {
    @objc dynamic var floorNum = 0
    @objc dynamic var crowdLevel = 0
    @objc dynamic var food = false
    @objc dynamic var created = NSDate()
    
}
