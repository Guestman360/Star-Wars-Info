//
//  InfoResourceChoiceViewModel.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

protocol HasInfoViewModel {
    var infoChoiceViewModel: InfoViewModelConformable { get }
}

protocol InfoViewModelConformable {
    var categories: [JSONObject]? { get }
    
    func getCategories()
}

class InfoChoiceViewModel: InfoViewModelConformable {
    
    let disposeBag = DisposeBag()
    
    var categories: [JSONObject]? = [] // Observable<[JSONObject]>(value: nil)
    
    // for some reason this causes internal init access error ... probably because of take(1) or modifiying categories from getCategories
    // App just doesnt like use of observable, found out i needed a public override init() { } in tab module
    //var categories: JSONObject = [:]
    
    func getCategories() {
        // run request and add to categories here
        StarWarsApi.requestInfo(ofType: .all)
            .asObservable()
            .take(1)
            .subscribe(onNext: { object in
                print("subscribing...")
                self.categories = object as [JSONObject]
            })
            .disposed(by: disposeBag)
        //let categories = StarWarsApi.requestInfo(ofType: .all)
//        categories.map { object in
//
//        }
        //self.categories = categories
    }
    
}
