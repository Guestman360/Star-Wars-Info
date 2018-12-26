//
//  Planet.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/24/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import RealmSwift
import RxDataSources

class Planet: Object {
    
    @objc dynamic var name: String = ""
    @objc dynamic var rotation_period: Int = 0
    @objc dynamic var orbital_period: String = ""
    @objc dynamic var diameter: String = ""
    @objc dynamic var climate: String = ""
    @objc dynamic var gravity: String = ""
    @objc dynamic var terrain: String = ""
    @objc dynamic var surface_water: String = ""
    @objc dynamic var population: String = ""
    
}
