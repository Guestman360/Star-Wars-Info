//
//  InfoResourceListViewController.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit
import RxSwift

class InfoListViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasInfoListViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.infoListViewModel
    
    let rx_disposeBag = DisposeBag()
    
    var finishedBlock: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Take category selection and make request to fetch all data, sort alpahbetically (with A-Z sections)
        // Bind tableview to response
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
