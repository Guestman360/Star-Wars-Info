//
//  StarWarsApi.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation

import RxSwift
import RxCocoa

import Alamofire

typealias JSONObject = [String: Any]

public enum Address: String {
    case all = ""
    case films = "films"
    case people = "people"
    case planets = "planets"
    case species = "species"
    case starships = "starships"
    case vehicles = "vehicles"
    
    private var baseURL: String { return Constants.starWarsBaseURL }
    var url: URL {
        return URL(string: baseURL.appending(rawValue))!
    }
}

protocol StarWarsApiProtocol {
    static func requestInfo(ofType type: Address) -> Observable<[JSONObject]>
}

struct StarWarsApi: StarWarsApiProtocol {
    
    /*
     This file needs to be injected as dependancy into whatever screen needs it
     
     when all is selected return the name keys alphbetized in tableview
     
     IMPORTANT!!! - When json object is retreived make sure to map over and ini with desired object type
     For example when planets category is selected, after request gets data map data by using (Planets.init) and load next tableview
     
     .filter { response, _ in
     return 200..<300 ~= response.statusCode
     }
     .map { _, data -> [[String: Any]] in
     guard let jsonObject = try? JSONSerialization.jsonObject(with: data,
     options: []),
     let result = jsonObject as? [[String: Any]] else { return [] }
     return result
     }
     .map { objects in
     return objects.compactMap(Event.init) // compact map prevents nil objects from returning as well
     }
     .subscribe(onNext: { [weak self] newEvents in
     self?.processEvents(newEvents)
     })
     */
    
    // MARK: - API errors
    enum Errors: Error {
        case requestFailed
    }
    
    // MARK: - API request wrapper
    static func requestInfo(ofType type: Address) -> Observable<[JSONObject]> {
        return request(address: type)
    }
    
    // MARK: - generic request for requesting data
    static private func request<T: Any>(address: Address, parameters: [String: String] = [:]) -> Observable<T> {
        return Observable.create { observer in
            var comps = URLComponents(string: address.url.absoluteString)!
            comps.queryItems = parameters.map(URLQueryItem.init)
            let url = try! comps.asURL()

            let request = Alamofire.request(url.absoluteString,
                                            method: .get,
                                            parameters: Parameters(),
                                            encoding: URLEncoding.httpBody)
            request.responseJSON { response in
                guard response.error == nil, let data = response.data,
                    let json = try? JSONSerialization.jsonObject(with: data, options: []) as? T, let result = json else {
                        observer.onError(Errors.requestFailed)
                        return
                }
                observer.onNext(result)
                observer.onCompleted()
            }

            return Disposables.create {
                request.cancel()
            }
        }
    }
    
}
