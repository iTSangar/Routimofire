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
    
    class func createUserWith(params params: [String : AnyObject]) {
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
    
    class func testUserWithoutParams() {
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
    
    class func updateUserWith(name name: String, params: [String : AnyObject]) {
        Alamofire.request(RouterUser.UpdateUser(name, params))
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
    
}