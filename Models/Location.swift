//
//  Location.swift
//  Library App
//
//  Created by Phillip LeMaster on 5/28/18.
//  Copyright © 2018 Phillip LeMaster. All rights reserved.
//

import Foundation
import RealmSwift

//Records user location and date
class Location: Object {
    @objc dynamic var userNum = 0
    @objc dynamic var latitude = 0.0
    @objc dynamic var longitude = 0.0
    @objc dynamic var created = NSDate()
}
