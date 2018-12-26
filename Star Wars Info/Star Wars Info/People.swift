//
//  People.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/24/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import RealmSwift
import RxDataSources

class People: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var height: String = ""
    @objc dynamic var mass: String = ""
    @objc dynamic var hair_color: String = ""
    @objc dynamic var skin_color: String = ""
    @objc dynamic var eye_color: String = ""
    @objc dynamic var birth_year: String = ""
    @objc dynamic var gender: String = ""
    
}
