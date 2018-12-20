//
//  FavoritesListViewController.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit
import RxSwift

class FavoritesListViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasFavoritesListViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.favoritesListViewModel
    let rx_disposeBag = DisposeBag()
    
    var finishedBlock: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Realm database that displays all recently saved models
        // must allow user to delete when swiping
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
