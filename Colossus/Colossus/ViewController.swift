//
//  ViewController.swift
//  Colossus
//
//  Created by Peter Schwarz on 10/17/15.
//  Copyright © 2015 Peter Schwarz. All rights reserved.
//

import UIKit



class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        SparkCloud.sharedInstance().loginWithUser("baskint@gmail.com", password: "password") { (error:NSError!) -> Void in
            if let e=error {
                print("Wrong credentials or no internet connectivity, please try again")
            }
            else {
                print("Logged in")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

