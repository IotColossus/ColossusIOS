//
//  ViewController.swift
//  Colossus
//
//  Created by Peter Schwarz on 10/17/15.
//  Copyright © 2015 Peter Schwarz. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }
    
    @IBAction func login(sender: UIButton) {
        let username = self.usernameField.text
        let password = self.passwordField.text
        SparkCloud.sharedInstance().loginWithUser(username, password: password) { (error:NSError!) -> Void in
            if error != nil {
                print("Wrong credentials or no internet connectivity, please try again")
            }
            else {
                print("User \(username) is Logged in!")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

