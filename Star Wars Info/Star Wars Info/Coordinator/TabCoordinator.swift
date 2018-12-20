//
//  TabCoordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/9/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

/*
 Each tab has its own coordinator, in my case use 3, they will be managed by Tabcoordinator, which in turn will be handled by AppCoordinator
 */

import UIKit

// MARK: Module

class Module {}

// MARK: RootTabCoordinator

protocol TabCoordinator {
    associatedtype RootType: UIViewController
    var rootController: RootType { get }
    var tabBarItem: UITabBarItem { get }
    var storyboard: UIStoryboard { get }
}

extension TabCoordinator {
    var deGenerisized: AnyTabCoordinator {
        return AnyTabCoordinator(self)
    }
}

protocol DependencyProvidable {
    associatedtype ProvidableType: Module
    var dependencies: ProvidableType { get }
}

typealias RootTabCoordinator = TabCoordinator & DependencyProvidable

class AnyTabCoordinator {
    var rootController: UIViewController
    var tabBarItem: UITabBarItem
    
    init<T: TabCoordinator>(_ tabCoordinator: T) {
        rootController = tabCoordinator.rootController
        tabBarItem = tabCoordinator.tabBarItem
    }
}
