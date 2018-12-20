//
//  InfoTabCoordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/12/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit

class InfoTabCoordinator: RootTabCoordinator {
    
    let storyboard = UIStoryboard(.main)
    
    var rootController: UINavigationController
    
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .search, tag: 1)
    
    let dependencies = InfoTabModule()
    
    init() {
        // Take coordinator as param in initializer
        let main: InfoChoiceViewController = storyboard.inflateVC(with: dependencies)
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
        
        main.finishedBlock = { self.showInfoListVC() }
    }
}

// MARK: View Controller inflation extensions
extension InfoTabCoordinator {
    
    func showInfoListVC() {
        let secondVC: InfoListViewController = storyboard.inflateVC(with: dependencies)
        self.rootController.pushViewController(secondVC, animated: true)
    }
}
