//
//  FavoritesTabModule.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/16/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation

class FavoritesTabModule: Module, HasFavoritesListViewModel, HasFavoritesDetailViewModel {
    
    var favoritesListViewModel: FavoritesListViewModelConformable {
        return FavoritesListViewModel()
    }
    
    var favoritesDetailViewModel: FavoritesDetailViewModelConformable {
        return FavoritesDetailViewModel()
    }
    
}
