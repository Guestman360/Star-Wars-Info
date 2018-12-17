//
//  Coordinator+ViewController.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import UIKit

extension Coordinator {
    func viewController(name: String) -> UIViewController {
        // Pay attention to "Main", need to be able to handle multiple names, use a parameter?
        let storyboard = UIStoryboard(name: name, bundle: nil)
        switch self {
        case .infoChoices(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier:
                "InfoChoicesVC") as! UINavigationController
            var vc = nc.viewControllers.first as! InfoChoiceViewController
            vc.bindViewModel(to: viewModel)
            return nc
        case .infoList(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier:
                "InfoListVC") as! UINavigationController
            var vc = nc.viewControllers.first as! InfoListViewController
            vc.bindViewModel(to: viewModel)
            return nc
        case .infoDetails(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier:
                "InfoDetailsVC") as! UINavigationController
            var vc = nc.viewControllers.first as! InfoDetailViewController
            vc.bindViewModel(to: viewModel)
            return nc
        case .favList(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier:
                "FavoriteListVC") as! UINavigationController
            var vc = nc.viewControllers.first as! FavoritesListViewController
            vc.bindViewModel(to: viewModel)
            return nc
        case .favDetails(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier:
                "FavoriteDetailsVC") as! UINavigationController
            var vc = nc.viewControllers.first as! FavoritesDetailViewController
            vc.bindViewModel(to: viewModel)
            return nc
        case .settings(let viewModel):
            let nc = storyboard.instantiateViewController(withIdentifier:
                "SettingsVC") as! UINavigationController
            var vc = nc.viewControllers.first as! SettingsViewController
            vc.bindViewModel(to: viewModel)
            return nc
        } }
}
