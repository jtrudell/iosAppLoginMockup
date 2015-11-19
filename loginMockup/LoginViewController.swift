//
//  LoginViewController.swift
//  loginMockup
//
//  Created by Jen Trudell on 11/19/15.
//  Copyright © 2015 Jen Trudell. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func loginPressed(sender: UIButton) {
        let sentUsername = userName.text!
        let sentPassword = password.text!
        
        
//        Alamofire.request(.GET, "https://gentle-fortress-2146.herokuapp.com")
        
        //connect to server and validate
        
        
        
        // if validated, set these ns defaults
//        let user = NSUserDefaults.standardUserDefaults()
//        user.setObject(sentUsername, forKey: "username")
//        user.setBool(true, forKey: "loggedin")
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
