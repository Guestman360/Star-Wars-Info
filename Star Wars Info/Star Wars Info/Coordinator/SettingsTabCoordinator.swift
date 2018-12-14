//
//  SettingsTabCoordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/12/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit

class SettingsTabCoordinator: RootTabCoordinator {
    
    let storyboard = UIStoryboard(.settings)
    
    var rootController: UINavigationController
    
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .more, tag: 3)
    
    init() {
        let main: SettingsViewController = storyboard.inflateVC()
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
        
        //main.finishedBlock = { self.showSecondViewController() }
    }
}
