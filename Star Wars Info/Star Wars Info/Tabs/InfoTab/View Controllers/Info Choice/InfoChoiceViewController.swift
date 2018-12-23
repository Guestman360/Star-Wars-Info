//
//  InfoResourceChoiceViewController.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit
import RxSwift

class InfoChoiceViewController: UIViewController { // BindableType, add later?
    
    @IBOutlet weak var tableView: UITableView!
    
    //typealias Dependencies = HasInfoViewModel
    //var dependencies: Dependencies!
    
    //lazy var viewModel = dependencies.infoChoiceViewModel
    
    //var categories: [JSONObject] = []
    //var categoryDict: [(String, Any)] = [(String, Any)]()
    var categories: [String] = ["films", "people", "planets", "species", "starships", "vehicles"]
    
    let rx_disposeBag = DisposeBag()
    
    var finishedBlock: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        // Add request to api to get cateogories, load them here
        bindViewModel()
    }
    
    func bindViewModel() {
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        // when cell is selected, make function that checks text matches with enum and return appropriate url to make request to
        // Start by running rx loader and segue when request is completed
        
//        viewModel.getCategories()
//
//        var names: JSONObject = [:] //viewModel.categories
//        if let categories = viewModel.categories?.first {
//            names = categories
//        }
//        self.categoryDict = names.sorted(by: { $0.0 < $1.0 })
        
//        viewModel.sectionedItems
//            .bind(to: tableView.rx.items(dataSource: dataSource))
//            .disposed(by: self.rx_disposeBag)
    }
    
    // take result and pass to request param
    private func loadSubCategory(from text: String) -> Address {
        switch text {
        case "films":
            return .films
        case "people":
            return .people
        case "planets":
            return .planets
        case "species":
            return .species
        case "starships":
            return .starships
        case "vehicles":
            return .vehicles
        default:
            return .all
        }
    }
    
}

extension InfoChoiceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.reuseID) as! InfoViewCell
        //cell.populate(from: self.categoryDict[indexPath.row].0, value: self.categoryDict[indexPath.row].1)
        cell.populate(from: categories[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        // take text and match it to enum and get url to perform request there
        let categorySelected = self.loadSubCategory(from: categories[indexPath.row])
        _ = StarWarsApi.requestInfo(ofType: categorySelected)
    }
    
}
