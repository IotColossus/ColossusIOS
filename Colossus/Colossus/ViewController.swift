//
//  ViewController.swift
//  Colossus
//
//  Created by Peter Schwarz on 10/17/15.
//  Copyright © 2015 Peter Schwarz. All rights reserved.
//

import UIKit



class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    @IBOutlet
    var tableView: UITableView!
    
    var devices = [SparkDevice]()
    
    let cellReuseIdentifier = "deviceCell"

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellReuseIdentifier)
        
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
                self.listDevices()
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func listDevices() {
        SparkCloud.sharedInstance().getDevices { (sparkDevices:[AnyObject]!, error:NSError!) -> Void in
            if let e = error {
                print("Check your internet connectivity [\(e)]")
                self.devices = [SparkDevice]()
            }
            else {
                if let devices = sparkDevices as? [SparkDevice] {
                    self.devices = devices
                } else {
                    self.devices = [SparkDevice]()
                }
            }
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        }
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.devices.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellReuseIdentifier)
        
        cell?.textLabel?.text = self.devices[indexPath.row].name
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        print("You selected cell #\(indexPath.row)!")
    }

    func showAlert(title: String, message: String) {
    
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: { action in
            switch action.style{
            case .Default:
                print("default")
                
            case .Cancel:
                print("cancel")
                
            case .Destructive:
                print("destructive")
            }
        }))
        self.presentViewController(alert, animated: true, completion: nil)
    
    }
}

