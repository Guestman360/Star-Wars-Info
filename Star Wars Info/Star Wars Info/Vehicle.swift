//
//  Vehicles.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/24/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import RealmSwift
import RxDataSources

class Vehicle: Object, Codable {
    
    @objc dynamic var name: String = ""
    @objc dynamic var model: Int = 0
    @objc dynamic var manufacturer: String = ""
    @objc dynamic var cost_in_credits: String = ""
    @objc dynamic var length: String = ""
    @objc dynamic var max_atmosphering_speed: String = ""
    @objc dynamic var crew: Int = 0
    @objc dynamic var passengers: String = ""
    @objc dynamic var cargo_capacity: String = ""
    @objc dynamic var consumables: String = ""
    @objc dynamic var vehicle_class: String = ""
    
}
