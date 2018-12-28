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
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias Dependencies = HasInfoListViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.infoListViewModel
    
    // fixed issue by going cmd+ctrl observable and adding public init
    // https://stackoverflow.com/questions/51364620/getting-initializer-is-inaccessible-due-to-internal-protection-level?rq=1
//    var selectedCategoryData = BehaviorSubject<[JSONObject]>(value: [])
//
//    var selectedObserver: Observable<[JSONObject]> {
//        return selectedCategoryData.asObserver()
//    }
    
    let rx_disposeBag = DisposeBag()
    
    var finishedBlock: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        //print("Category data: \(String(describing: try? selectedCategoryData.value().count))")
        // Do any additional setup after loading the view.
        // Take category selection and make request to fetch all data, sort alpahbetically (with A-Z sections)
        // Bind tableview to response
        // When on this vc run selectedCategoryData immediately, or run request, run activity indicator, then once data is recieved, set selectedCategoryData here then segue?
    }
    
    func bindViewModel() {
        
        // Run activity indicator
        
        // films is placeholder for now, pass in var from previous screen
        _ = viewModel.requestCategoryData(of: .all)
        
        viewModel.requestData
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: InfoViewCell.reuseID,
                                         cellType: InfoViewCell.self)) { row, element, cell in
            //cell.populate(from: )
        }.disposed(by: rx_disposeBag)
    }
    
    // Create helper function to determine model type to use, use switch statement?

}
