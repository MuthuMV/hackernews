//
//  ApiUrlCreator.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import Foundation

class ApiURLCreator {
    
    enum CUSTOMAPI: String {
        case USER = "user"
        case ITEM = "item"
    }
    
    static func CUSTOM(api: CUSTOMAPI) -> String {
        return "\(BaseService.BASE_API_URL)/\(api.rawValue)"
    }
    
}
