//
//  ViewController.swift
//  loginMockup
//
//  Created by Jen Trudell on 11/19/15.
//  Copyright © 2015 Jen Trudell. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let userDefaults = NSUserDefaults.standardUserDefaults()


    @IBOutlet weak var nameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let loggedIn = userDefaults.valueForKey("loggedin") as? String
        
        if loggedIn == "no" {
            self.performSegueWithIdentifier("send_to_login", sender: self)
        } else if loggedIn == "yes" {
            nameLabel.text = userDefaults.valueForKey("username") as! String
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            self.performSegueWithIdentifier("send_to_login", sender: self)
            
        }

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //checks for logged in user
    //sends to login screen when app opens if no logged in user
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(true)

        
        

    }
    
    //sends to login screen when logout pressed
    @IBAction func logoutPressed(sender: UIButton) {
        //clear NSUserDefaults
        userDefaults.setObject("no", forKey: "loggedin")
        userDefaults.synchronize()
        //send back to login page
        self.performSegueWithIdentifier("send_to_login", sender: self)
    }
    
    

}

