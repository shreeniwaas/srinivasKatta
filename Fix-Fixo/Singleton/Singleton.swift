//
//  Singleton.swift
//  CRM
//
//  Created by Shweta on 29/07/21.
//  Copyright © 2021 Shweta. All rights reserved.
//

import Foundation
class Singleton {
    static let shareInstance = Singleton()
    var msg: String = ""
}
