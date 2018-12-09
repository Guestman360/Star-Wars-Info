//
//  Coordinator.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation

enum Coordinator {
    case infoChoices(InfoChoiceViewModel)
    case infoList(InfoListViewModel)
    case infoDetails(InfoDetailViewModel)
    case favList(FavoritesListViewModel)
    case favDetails(FavoritesDetailViewModel)
    case settings(SettingsViewModel)
}
