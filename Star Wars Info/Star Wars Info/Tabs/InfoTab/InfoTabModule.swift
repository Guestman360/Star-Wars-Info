//
//  InfoTabModule.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/16/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation

class InfoTabModule: Module, HasInfoViewModel, HasInfoListViewModel, HasInfoDetailViewModel {
    
    var infoChoiceViewModel: InfoViewModelConformable {
        return InfoChoiceViewModel()
    }

    var infoListViewModel: InfoListViewModelConformable {
        return InfoListViewModel()
    }

    var infoDetailViewModel: InfoDetailViewModelConformable {
        return InfoDetailViewModel()
    }
    
}
