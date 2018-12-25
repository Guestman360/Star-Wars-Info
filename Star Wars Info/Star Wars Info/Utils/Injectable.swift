//
//  Injectable.swift
//  Star Wars Info
//
//  Created by Matthew Guest on 12/16/18.
//  Copyright © 2018 Matthew Guest. All rights reserved.
//

import UIKit

public protocol Injectable {
    associatedtype Dependencies
    var dependencies: Dependencies! { get set }
}
