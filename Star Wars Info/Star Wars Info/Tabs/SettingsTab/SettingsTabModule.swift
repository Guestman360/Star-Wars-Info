//
//  SettingsTabModule.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/16/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation

class SettingsTabModule: Module, HasSettingsViewModel {
    
    var settingsViewModel: SettingsViewModelConformable {
        return SettingsViewModel()
    }
    
}
