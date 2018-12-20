//
//  InfoResourceChoiceViewModel.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation

protocol HasInfoViewModel {
    var infoChoiceViewModel: InfoViewModelConformable { get }
}

protocol InfoViewModelConformable {
    
}

struct InfoChoiceViewModel: InfoViewModelConformable {
    
    //let coordinatorType: CoordinatorType
    
    init() { // coordinator: CoordinatorType
        //self.coordinatorType = coordinator
    }
    
}
