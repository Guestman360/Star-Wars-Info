//
//  SettingsViewController.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit
import RxSwift

class SettingsViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasSettingsViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.settingsViewModel
    let rx_disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // toggle dark theme, add wookie data, make both toggle switches
    }
    
    func bindViewModel() {
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
