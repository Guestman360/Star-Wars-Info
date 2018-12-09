//
//  CoordinatorType.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/8/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import Foundation

import UIKit
import RxSwift

protocol CoordinatorType {
    /// transition to another scene
    @discardableResult
    func transition(to coordinator: Coordinator, type: TransitionType) -> Completable
    
    /// pop scene from navigation stack or dismiss current modal
    @discardableResult
    func pop(animated: Bool) -> Completable
}

extension CoordinatorType {
    @discardableResult
    func pop() -> Completable {
        return pop(animated: true)
    }
}
