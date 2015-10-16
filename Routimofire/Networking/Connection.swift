//
//  Connection.swift
//  Routimofire
//
//  Created by Ítalo Sangar on 10/15/15.
//  Copyright © 2015 iTSangar. All rights reserved.
//

import Foundation
import Alamofire

class ConnectionUser {
    
    class func create(withParams params: [String : AnyObject]) {
        Alamofire.request(RouterUser.CreateUser(params))
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .Success(let JSON):
                    print(JSON)
                case .Failure(let error):
                    print(error)
                }
            })
    }
    
    class func test() {
        Alamofire.request(RouterUser.TestUser)
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .Success(let JSON):
                    print(JSON)
                case .Failure(let error):
                    print(error)
                }
            })
    }
    
    class func update(username username: String, withParams params: [String : AnyObject]) {
        Alamofire.request(RouterUser.UpdateUser(username, params))
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .Success(let JSON):
                    print(JSON)
                case .Failure(let error):
                    print(error)
                }
            })
    }
    
    class func read(username username: String, completion:(success: AnyObject?, error: String?) -> Void) {
        Alamofire.request(RouterUser.ReadUser(username))
            .responseJSON(completionHandler: {
                response in
                switch response.result {
                case .Success(let JSON):
                    completion(success: JSON, error: nil)
                case .Failure(let error):
                    completion(success: nil, error: (error as NSError).description)
                }
            })
    }
    
}