//
//  InfoViewCell.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/16/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit

class InfoViewCell: UITableViewCell {
    
    static let reuseID = "InfoCell"
    
    @IBOutlet weak var categoryName: UILabel!
    
    //var categoryUrl: String = ""
    
    func populate(from data: String) {
        
        categoryName.text = data
    }
    
//    func populate(from key: String, value: Any) {
//
//        categoryName.text = key
//        if let urlValue = value as? String {
//            categoryUrl = urlValue
//        }
//    }
}
