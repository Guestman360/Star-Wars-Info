//
//  FavoriteTabCoordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/12/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit

class FavoritesTabCoordinator: RootTabCoordinator {
    
    let storyboard = UIStoryboard(.favorites)
    
    var rootController: UINavigationController
    
    var tabBarItem: UITabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag: 2)
    
    init() {
        let main: FavoritesListViewController = storyboard.inflateVC()
        
        rootController = UINavigationController(rootViewController: main)
        rootController.tabBarItem = tabBarItem
        
        main.finishedBlock = { self.showFavoritesDetailVC() }
    }
}

// MARK: View Controller inflation extensions
extension FavoritesTabCoordinator {
    
    func showFavoritesDetailVC() {
        let secondVC: FavoritesDetailViewController = storyboard.inflateVC()
        self.rootController.pushViewController(secondVC, animated: true)
    }
}
