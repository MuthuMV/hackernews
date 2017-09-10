//
//  BaseService.swift
//  hackernews
//
//  Created by Muthu on 9/11/17.
//  Copyright © 2017 UrbanPiper. All rights reserved.
//

import Alamofire
import ObjectMapper
import ReachabilitySwift

class BaseService {
    
    static let API_URL = "https://hacker-news.firebaseio.com/v0/"
    
    static var BASE_API_URL: String! {
        return BaseService.API_URL
    }
    
    //Handles Void Responses
    static func makeCall(method: HTTPMethod ,url: String,parameter: [String: Any]? = nil, completionHandler: @escaping (_ success: Bool,_ error: ErrorType?) -> Void) -> Alamofire.Request {
        let requst = try? NetworkManager.sharedManager.request(url.asURL(), method: method, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseData { (response) in
                switch response.result {
                case .success( _):
                    completionHandler(true,nil)
                    break
                case .failure(let error):
                    if !(Reachability()?.isReachable)! {
                        completionHandler(false, ErrorType.INTERNET)
                    } else {
                        completionHandler(false, ErrorType.SERVER)
                    }
                    print("Error: \(error.localizedDescription)")
                }
        }
        return requst!
    }
    
    //Handles Object Responses
    static func makeCall<T: Mappable>(method: HTTPMethod ,url: String,parameter: [String: Any]? = nil, completionHandler: @escaping (_ data: T?,_ error: ErrorType?) -> Void) -> Alamofire.Request {
        let request = try? NetworkManager.sharedManager.request(url.asURL(), method: method, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                ApiResponseHandler<T>.handleObjectResponse(response: response, completion: completionHandler)
        }
        return request!
    }
    
    //Handles Array Responses
    static func makeCall<T: Mappable>(method: HTTPMethod,url: String,parameter: [String: Any]? = nil, completionHandler: @escaping (_ data: [T]?,_ error: ErrorType?) -> Void) -> Alamofire.Request {
        let request = try? NetworkManager.sharedManager.request(url.asURL(), method: method, parameters: parameter, encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<300)
            .responseJSON { (response) in
                ApiResponseHandler<T>.handleArrayResponse(response: response, completion: completionHandler)
        }
        return request!
    }
}
