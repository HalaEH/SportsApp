//
//  Connectivity.swift
//  SportsApp
//
//  Created by Muhammad Kholif on 5/19/22.
//  Copyright © 2022 Hala Emad. All rights reserved.
//

import Foundation
import Alamofire
class Connectivity{
        
        static let manager = NetworkReachabilityManager(host: "www.apple.com")
        
        static func isNetworkReachable() -> Bool {
            return manager?.isReachable ?? false
        }
        
}
