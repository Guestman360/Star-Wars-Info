//
//  URLSession+Rx.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/19/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation
import RxSwift
import SwiftyJSON

public enum RxURLSessionError: Error {
    case unknown
    case invalidResponse(response: URLResponse)
    case requestFailed(response: HTTPURLResponse, data: Data?)
    case deserializationFailed
}
// Reactive extension is URLSession.shared.rx ...
extension Reactive where Base: URLSession {
    
    func response(request: URLRequest) -> Observable<(HTTPURLResponse, Data)> {
        return Observable.create { observer in
            
            let task = self.base.dataTask(with: request) { (data, response, error) in
                guard let response = response, let data = data else {
                    observer.on(.error(error ?? RxURLSessionError.unknown))
                    return
                }
                guard let httpResponse = response as? HTTPURLResponse else {
                    observer.on(.error(RxURLSessionError.invalidResponse(response: response)))
                    return
                }
                
                observer.onNext((httpResponse, data))
                observer.on(.completed)
            }
            task.resume()
            
            return Disposables.create(with: task.cancel)
        }
    }
    
    func string(request: URLRequest) -> Observable<String> {
        return data(request: request).map { d in
            return String(data: d, encoding: .utf8) ?? ""
        }
    }
    
    func json(request: URLRequest) -> Observable<JSON> {
        return data(request: request).map { d in
            return try JSON(data: d)
        }
    }
    
    func image(request: URLRequest) -> Observable<UIImage> {
        return data(request: request).map { d in
            return UIImage(data: d) ?? UIImage()
        }
    }
    
}

//extension Observable where E == (HTTPURLResponse, Data) {
//
//    func cache() -> Observable<E> {
//        return self.do(onNext: { (response, data) in
//            if let url = response.url?.absoluteString, 200 ..< 300 ~= response.statusCode {
//                internalCache[url] = data
//            }
//        })
//    }
//
//}
