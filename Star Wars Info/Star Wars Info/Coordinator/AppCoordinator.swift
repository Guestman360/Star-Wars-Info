//
//  Coordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit

import UIKit

class AppCoordinator {
    
    var tabBarController: UITabBarController
    var tabs: [AnyTabCoordinator]
    var window: UIWindow?
    
    public init(window: UIWindow?) {
        self.tabBarController = UITabBarController()
        self.window = window
        
        window?.rootViewController = tabBarController
        
        let tabs = [InfoTabCoordinator().deGenerisized,
                    FavoritesTabCoordinator().deGenerisized,
                    SettingsTabCoordinator().deGenerisized]
        
        self.tabs = tabs
    }
    
    public func start() {
        tabBarController.viewControllers = tabs.map { $0.rootController }
        window?.makeKeyAndVisible()
    }
    
}

/*
 //     Refactor AppCoordinator to manage other coordinators, like info, favorites and settings
 //
 //     https://stackoverflow.com/questions/46492824/how-do-i-use-coordinators-with-a-uiitabbarcontroller
 //     https://stackoverflow.com/questions/44479493/how-to-create-a-uitabbarcontroller-and-connect-its-tabs-with-coordinators
 //     https://novemberfive.co/blog/creating-dynamic-screens-protocol-oriented-mvvm-swift
 //     https://mattwyskiel.github.io/posts/2016/07/20/protocol-oriented-app-coordinator-swift.html
 //     https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-coordinators-3-6-3960ad9a6d85
 //     https://forums.raywenderlich.com/t/how-to-use-scenecoordinator-with-uitabbarcontroller/29346/9
 //
 //     https://github.com/ncubelic/coordinators/blob/master/Coordinator/TabCoordinator.swift
 //     https://github.com/thefuntasty/MVVM-C-Example/blob/master/testMVVM/SeasonsCoordinator.swift
 //     */
