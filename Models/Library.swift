//
//  Library.swift
//  Library App
//
//  Created by Phillip LeMaster on 5/28/18.
//  Copyright © 2018 Phillip LeMaster. All rights reserved.
//

import Foundation
import RealmSwift

//stores library object and if it has free food
class Library: Object {
    @objc dynamic var name = ""
    @objc dynamic var floors = 0
    @objc dynamic var food = false
    @objc dynamic var created = NSDate()
}
