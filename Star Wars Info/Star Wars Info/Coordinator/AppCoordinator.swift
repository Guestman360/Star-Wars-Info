//
//  Coordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class AppCoordinator: CoordinatorType {
    
    fileprivate var window: UIWindow
    fileprivate var currentViewController: UIViewController
    //var childCoordinators: [NSObject] = []
    
    /*
     Refactor AppCoordinator to manage other coordinators, like info, favorites and settings
     
     https://stackoverflow.com/questions/46492824/how-do-i-use-coordinators-with-a-uiitabbarcontroller
     https://stackoverflow.com/questions/44479493/how-to-create-a-uitabbarcontroller-and-connect-its-tabs-with-coordinators
     https://novemberfive.co/blog/creating-dynamic-screens-protocol-oriented-mvvm-swift
     https://mattwyskiel.github.io/posts/2016/07/20/protocol-oriented-app-coordinator-swift.html
     https://medium.com/sudo-by-icalia-labs/ios-architecture-mvvm-c-coordinators-3-6-3960ad9a6d85
     https://forums.raywenderlich.com/t/how-to-use-scenecoordinator-with-uitabbarcontroller/29346/9
     
     https://github.com/ncubelic/coordinators/blob/master/Coordinator/TabCoordinator.swift
     https://github.com/thefuntasty/MVVM-C-Example/blob/master/testMVVM/SeasonsCoordinator.swift
     */
    
    required init(window: UIWindow) {
        self.window = window
        currentViewController = window.rootViewController!
    }
    
    static func actualViewController(for viewController: UIViewController) -> UIViewController {
        if let navigationController = viewController as? UINavigationController {
            return navigationController.viewControllers.first!
        } else {
            return viewController
        }
    }
    
    @discardableResult
    func transition(to coordinator: Coordinator, type: TransitionType) -> Completable {
        let subject = PublishSubject<Void>()
        let viewController = coordinator.viewController()
        switch type {
        case .root:
            currentViewController = AppCoordinator.actualViewController(for: viewController)
            window.rootViewController = viewController
            subject.onCompleted()
            
        case .push:
            guard let navigationController = currentViewController.navigationController else {
                fatalError("Can't push a view controller without a current navigation controller")
            }
            // one-off subscription to be notified when push complete
            _ = navigationController.rx.delegate
                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
                .map { _ in }
                .bind(to: subject)
            navigationController.pushViewController(viewController, animated: true)
            currentViewController = AppCoordinator.actualViewController(for: viewController)
            
        case .modal:
            currentViewController.present(viewController, animated: true) {
                subject.onCompleted()
            }
            currentViewController = AppCoordinator.actualViewController(for: viewController)
        }
        return subject.asObservable()
            .take(1)
            .ignoreElements()
    }
    
    @discardableResult
    func pop(animated: Bool) -> Completable {
        let subject = PublishSubject<Void>()
        if let presenter = currentViewController.presentingViewController {
            // dismiss a modal controller
            currentViewController.dismiss(animated: animated) {
                self.currentViewController = AppCoordinator.actualViewController(for: presenter)
                subject.onCompleted()
            }
        } else if let navigationController = currentViewController.navigationController {
            // navigate up the stack
            // one-off subscription to be notified when pop complete
            _ = navigationController.rx.delegate
                .sentMessage(#selector(UINavigationControllerDelegate.navigationController(_:didShow:animated:)))
                .map { _ in }
                .bind(to: subject)
            guard navigationController.popViewController(animated: animated) != nil else {
                fatalError("can't navigate back from \(currentViewController)")
            }
            currentViewController = AppCoordinator.actualViewController(for: navigationController.viewControllers.last!)
        } else {
            fatalError("Not a modal, no navigation controller: can't navigate back from \(currentViewController)")
        }
        return subject.asObservable()
            .take(1)
            .ignoreElements()
    }
}
