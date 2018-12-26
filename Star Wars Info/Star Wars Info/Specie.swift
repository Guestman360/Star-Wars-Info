//
//  Specie.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/24/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import RealmSwift
import RxDataSources

class Specie: Object {
    
    @objc dynamic var title: String = ""
    @objc dynamic var episode_id: Int = 0
    @objc dynamic var opening_crawl: String = ""
    @objc dynamic var director: String = ""
    @objc dynamic var producer: String = ""
    @objc dynamic var release_date: String = ""
    
}
