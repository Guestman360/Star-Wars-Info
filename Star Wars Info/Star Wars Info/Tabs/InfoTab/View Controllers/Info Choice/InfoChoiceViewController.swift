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
    
    typealias Dependencies = HasInfoViewModel
    var dependencies: Dependencies!
    
    lazy var viewModel = dependencies.infoChoiceViewModel
    
    //var viewModel: InfoChoiceViewModel!
    let rx_disposeBag = DisposeBag()
    
    var finishedBlock: (() -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        // Add request to api to get cateogories, load them here
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
