//
//  TabCoordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/9/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import UIKit

class TabCoordinator: NSObject {
    
    var tabBarController: UITabBarController
    //var childCoordinators: [NSObject] = []
    var childCoordinators: [AppCoordinator] = []
    let appCoordinator: AppCoordinator
    var window: UIWindow?
    
//    var homeCoordinator: HomeCoordinator
//    var favoriteCoordinator: FavoriteCoordinator
//    var cartCoordinator: CartCoordinator
    
    init(tabBarController: UITabBarController, window: UIWindow, coordinator: AppCoordinator) {
        self.tabBarController = tabBarController
        self.window = window
        self.appCoordinator = coordinator
        
//        homeCoordinator = HomeCoordinator(navigationController: UINavigationController())
//        favoriteCoordinator = FavoriteCoordinator(navigationController: UINavigationController())
//        cartCoordinator = CartCoordinator(navigationController: UINavigationController())
        //super.init()
    }
    
    func start() {
        
        var controllers: [UIViewController] = []
        
        // Create coordinators for each screen? Or initiate infoChoice as root and transition to it (only on first item initially) then add
        // the rest of initialized view controllers
        
        // Setting coordinator for each tab
        let infoCoordinator = AppCoordinator(window: self.window!)
        let favoritesCoordinator = AppCoordinator(window: self.window!)
        let settingsCoordinator = AppCoordinator(window: self.window!)
        
        // Setting up view model for each tab
        let infoChoiceViewModel = InfoChoiceViewModel(coordinator: infoCoordinator)
        let favoritesListViewModel = FavoritesListViewModel(coordinator: favoritesCoordinator)
        let settingsViewModel = SettingsViewModel(coordinator: settingsCoordinator)
        
        let firstTab = Coordinator.infoChoices(infoChoiceViewModel)
        let secondTab = Coordinator.favList(favoritesListViewModel)
        let thirdTab = Coordinator.settings(settingsViewModel)
        
        let infoTab = appCoordinator.transition(to: firstTab, type: .root)
        let favTab = appCoordinator.transition(to: secondTab, type: .root)
        let settingsTab = appCoordinator.transition(to: thirdTab, type: .root)
        
        //self.childCoordinators.append([infoTab, favTab, settingsTab])
//        homeCoordinator.start()
//        favoriteCoordinator.start()
//        cartCoordinator.start()
//
//        let homeController = homeCoordinator.navigationController
//        homeController.tabBarItem = UITabBarItem(title: "Home", image: UIImage(), selectedImage: nil)
//        childCoordinators.append(homeCoordinator)
//
//        let favoriteController = favoriteCoordinator.navigationController
//        favoriteController.tabBarItem = UITabBarItem(title: "Favorite", image: UIImage(), selectedImage: nil)
//        childCoordinators.append(favoriteCoordinator)
//
//        let cartController = cartCoordinator.navigationController
//        cartController.tabBarItem = UITabBarItem(title: "Cart", image: UIImage(), selectedImage: nil)
//        childCoordinators.append(cartController)
//
//        controllers.append(homeController)
//        controllers.append(favoriteController)
//        controllers.append(cartController)
//
//        tabBarController.setViewControllers(controllers, animated: true)
//        tabBarController.tabBar.isTranslucent = true
//        tabBarController.delegate = self
    }
}

extension TabCoordinator: UITabBarControllerDelegate {
    
}
