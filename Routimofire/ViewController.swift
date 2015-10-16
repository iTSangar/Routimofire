//
//  ViewController.swift
//  Routimofire
//
//  Created by Ítalo Sangar on 10/15/15.
//  Copyright © 2015 iTSangar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConnectionUser.create(withParams: ["YYZ": "Toronto Pearson", "DUB": "Dublin"])
        ConnectionUser.test()
        ConnectionUser.update(username: "King Tail", withParams: ["YYZ": "Vancouver Pearson", "DUB": "Alaska"])
        ConnectionUser.read(username: "mattt", completion: {
            success, error in
            if let e: String = error {
                print(e)
            } else if let s: AnyObject = success {
                print(s)
            }
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}