//
//  NetworkManager.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import Foundation
import Alamofire
import Sniffer

class NetworkManager: Alamofire.SessionManager {
    static let sharedManager: NetworkManager = {
        let configuration = URLSessionConfiguration.default
        Sniffer.enable(in: configuration)
        let manager = NetworkManager(configuration: configuration)
        return manager
    }()
}

