//
//  AbstractMethod.swift
//  Test
//
//  Created by Ismael Ussefatt on 16/12/19.
//  Copyright © 2019 Ismael Ussefatt. All rights reserved.
//

import Foundation

func abstractMethod(_ function: String = #function, _ file: String = #file) -> Never {
    fatalError("\(function) in \(file) must be overriden in subclass")
}
