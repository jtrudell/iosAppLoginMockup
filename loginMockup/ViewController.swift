//
//  ViewController.swift
//  loginMockup
//
//  Created by Jen Trudell on 11/19/15.
//  Copyright © 2015 Jen Trudell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //checks for logged in user
    //sends to login screen when app opens if no logged in user
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)
        
        let user = NSUserDefaults.standardUserDefaults()
        let loggedIn = user.boolForKey("loggedIn") as Bool
        
        if loggedIn == true {
            self.performSegueWithIdentifier("send_to_login", sender: self)
        } else {
            self.nameLabel.text =  user.valueForKey("username") as? String
        }
    }
    
    //sends to login screen when logout pressed
    @IBAction func logoutPressed(sender: UIButton) {
        //clear NSUserDefaults
        let userDefaults = NSUserDefaults.standardUserDefaults()
        userDefaults.setBool(false, forKey: "loggedin")
        userDefaults.removePersistentDomainForName(NSBundle.mainBundle().bundleIdentifier!)
        //send back to login page
        self.performSegueWithIdentifier("send_to_login", sender: self)
    }
    
    

}

