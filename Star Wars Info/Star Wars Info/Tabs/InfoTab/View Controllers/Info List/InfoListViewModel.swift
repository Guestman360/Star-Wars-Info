//
//  InfoResourceListViewModel.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import RxSwift

protocol HasInfoListViewModel {
    var infoListViewModel: InfoListViewModelConformable { get }
}

protocol InfoListViewModelConformable {
//    var requestData: [JSONObject]? { get }
//
//    func requestCategoryData(of type: Address)
    var requestData: Observable<[JSONObject]> { get } // var requestData: BehaviorSubject<[JSONObject]?> { get }
    //var addressType: Address { get }
    
    func requestCategoryData(of type: Address) -> Observable<[JSONObject]>
}

class InfoListViewModel: InfoListViewModelConformable {
    
    var requestData = Observable<[JSONObject]>()
    
    func requestCategoryData(of type: Address) -> Observable<[JSONObject]> {
        let data = StarWarsApi.requestInfo(ofType: type)
            .asObservable()
            .take(1)
        
        requestData = data
        
        return data
    }
    
//    func categoryRequest(address: Address) {
//        // Use function to get model type
//        let data = requestCategoryData(of: address)
//        requestData = data
//    }
    
    // Create helper function to determine which model to use based on JSON
//    private func determineModelType() {
//        
//    }
    
    //var requestData: Observable<[JSONObject]?>
    
//    var requestData: [JSONObject]? = []
//
//    func requestCategoryData(of type: Address) {
//        StarWarsApi.requestInfo(ofType: type)
//            .asObservable()
//            .subscribe(onNext: { object in
//                print("subscribing...")
//                self.requestData = object as [JSONObject]
//            })
//            .disposed(by: disposeBag)
//    }
}
