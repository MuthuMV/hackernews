//
//  ApiResponseHandler.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import Foundation
import ObjectMapper
import Alamofire
import ReachabilitySwift

struct ApiResponseHandler<T: Mappable> {
    
    let reachability = Reachability()
    
    static func handleObjectResponse(response: Alamofire.DataResponse<Any>, completion: (_ data: T?, _ error: ErrorType?) -> Void) {
        switch response.result {
        case .success(let value):
            if let data = Mapper<T>().map(JSONObject: value) {
                completion(data, nil)
            } else {
                print("JSON PARSE FAILED for : \(value)")
                completion(nil, ErrorType.JSON_PARSING)
            }
        case .failure(let error):
            if !(Reachability()?.isReachable)! {
                completion(nil, ErrorType.INTERNET)
            } else {
                completion(nil, ErrorType.SERVER)
            }
            print("Error: \(error.localizedDescription)")
        }
    }
    
    static func handleArrayResponse(response: Alamofire.DataResponse<Any>, completion: (_ data: [T]?, _ error: ErrorType?) -> Void) {
        switch response.result {
        case .success(let value):
            if let data = Mapper<T>().mapArray(JSONObject: value) {
                completion(data, nil)
            } else {
                print("JSON PARSE FAILED for : \(value)")
                completion(nil, ErrorType.JSON_PARSING)
            }
            break
        case .failure(let error):
            if !(Reachability()?.isReachable)! {
                completion(nil, ErrorType.INTERNET)
            } else {
                completion(nil, ErrorType.SERVER)
            }
            print("Error: \(error.localizedDescription)")
        }
    }
}
