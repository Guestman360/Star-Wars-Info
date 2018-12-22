//
//  InfoResourceChoiceViewController.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit
import RxSwift

class InfoChoiceViewController: UIViewController, Injectable { // BindableType, add later?
    
    @IBOutlet weak var tableView: UITableView!
    
    typealias Dependencies = HasInfoViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.infoChoiceViewModel
    
    var categories: [JSONObject] = []
    var categoryDict: [(String, Any)] = [(String, Any)]()
    
    let rx_disposeBag = DisposeBag()
    
    var finishedBlock: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Add request to api to get cateogories, load them here
        bindViewModel()
    }
    
    func bindViewModel() {
        
        viewModel.getCategories()
        
        var names: JSONObject = [:] //viewModel.categories
        if let categories = viewModel.categories?.first {
            names = categories
        }
        self.categoryDict = names.sorted(by: { $0.0 < $1.0 })
        
//        viewModel.sectionedItems
//            .bind(to: tableView.rx.items(dataSource: dataSource))
//            .disposed(by: self.rx_disposeBag)
    }
    
}

extension InfoChoiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.reuseID) as! InfoViewCell
        cell.populate(from: self.categoryDict[indexPath.row].0, value: self.categoryDict[indexPath.row].1)
        return cell
    }
    
}
