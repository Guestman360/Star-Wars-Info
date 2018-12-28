//
//  ApplicationTheme.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import UIKit

//enum UITheme: Int {
//    case light = 1
//    case dark = 2
//}
//
//struct ApplicationTheme {
//
//    static let shared = ApplicationTheme()
//
//}

// https://academy.realm.io/posts/architecting-a-robust-color-system-swift-tryswift-2017-ragone/
// https://github.com/luispadron/GradePoint/blob/master/GradePoint/Managers/ApplicationTheme.swift
// https://github.com/kyleshin/demoTheme/blob/master/themeDemo/Controller/SettingsViewController.swift
// https://medium.com/@mczachurski/ios-dark-theme-9a12724c112d

enum Theme: Int {
    case light, dark
    
    private enum Keys {
        static let currentTheme = "CurrentTheme"
    }
    
    static var current: Theme {
        let storedTheme = UserDefaults.standard.integer(forKey: Keys.currentTheme)
        return Theme(rawValue: storedTheme) ?? .light
    }
    
    func apply(){
        UserDefaults.standard.set(rawValue, forKey: Keys.currentTheme)
        UINavigationBar.appearance().tintColor = standardTintColor
        UINavigationBar.appearance().barTintColor = viewControllerBackgroundColor
    }
    
    var standardTextColor: UIColor {
        switch self {
        case .light:
            return UIColor.black
        case .dark:
            return UIColor.white
        }
    }
    
    var standardBackgroundColor: UIColor {
        switch self {
        case .light:
            return UIColor.white
        case .dark:
            return UIColor.black
        }
    }
    
    var standardTintColor:UIColor {
        switch self {
        case .light:
            return UIColor.black
        case .dark:
            return UIColor.white
        }
    }
    
    var viewControllerBackgroundColor: UIColor {
        switch self{
        case .light:
            return UIColor.white
        case .dark:
            return UIColor.darkGray
        }
    }
}
