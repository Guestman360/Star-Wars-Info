//
//  FavoritesDetailViewController.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit
import RxSwift

class FavoritesDetailViewController: UIViewController, Injectable {
    
    typealias Dependencies = HasFavoritesDetailViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.favoritesDetailViewModel
    let rx_disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Same as info detail except loading the database data,  have an unfavorite button at top right corner
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
