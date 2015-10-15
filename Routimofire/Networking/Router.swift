//
//  Router.swift
//  Routimofire
//
//  Created by Ítalo Sangar on 10/15/15.
//  Copyright © 2015 iTSangar. All rights reserved.
//

import Foundation
import Alamofire

enum RouterUser: URLRequestConvertible {
    static let baseURLString = "http://example.com"
    static var OAuthToken: String?
    
    case CreateUser([String: AnyObject])
    case ReadUser(String)
    case UpdateUser(String, [String: AnyObject])
    case DestroyUser(String)
    case TestUser
    
    var method: Alamofire.Method {
        switch self {
        case .CreateUser:
            return .POST
        case .ReadUser:
            return .GET
        case .UpdateUser:
            return .PUT
        case .DestroyUser:
            return .DELETE
        case .TestUser:
            return .GET
        }
    }
    
    var path: String {
        switch self {
        case .CreateUser:
            return "/users"
        case .ReadUser(let username):
            return "/users/\(username)"
        case .UpdateUser(let username, _):
            return "/users/\(username)"
        case .DestroyUser(let username):
            return "/users/\(username)"
        case .TestUser:
            return ""
        }
    }
    
    var parameters: [String: AnyObject]? {
        switch self {
        case .CreateUser(let params):
            return params
        case .ReadUser(_):
            return nil
        case .UpdateUser(_, let params):
            return params
        case .DestroyUser(_):
            return nil
        case .TestUser:
            return nil
        }
    }
    
    var encod: Alamofire.ParameterEncoding {
        switch self {
        case .CreateUser(_):
            return .JSON
        default:
            return .URL
        }
    }
    
    // MARK: URLRequestConvertible
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: RouterUser.baseURLString)!
        let mutableURLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(path))
        mutableURLRequest.HTTPMethod = method.rawValue
        
        if let token = RouterUser.OAuthToken {
            mutableURLRequest.setValue("Bearer \(token)", forHTTPHeaderField: "Authorization")
        }
        
        return encod.encode(mutableURLRequest, parameters: parameters).0
    }
    
}