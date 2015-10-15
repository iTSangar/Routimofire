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
        
        ConnectionUser.createUserWith(params: ["YYZ": "Toronto Pearson", "DUB": "Dublin"])
        ConnectionUser.testUserWithoutParams()
        ConnectionUser.updateUserWith(name: "King Tail", params: ["YYZ": "Vancouver Pearson", "DUB": "Alaska"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

