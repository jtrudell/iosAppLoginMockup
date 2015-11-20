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


    // Login functions
    @IBAction func submitPressed(sender: AnyObject) {

        let sentUsername = userName.text!
        let sentPassword = password.text!

        let loginDetails = [
            "email": sentUsername,
            "password": sentPassword
        ]

        // Authenticate with Alamofire
        func authenticateUser(parameters:[String:String]) {

            let loginUrl = "https://gentle-fortress-2146.herokuapp.com/login"

            Alamofire.request(.POST, loginUrl, parameters: parameters).validate().responseJSON { response in
                switch response.result {
                case .Success:
                    if let value = response.result.value {
                        let user = JSON(value)
                        print(user)
 
                        // set NSUserDefaults
                        let userDefaults = NSUserDefaults.standardUserDefaults()
                        userDefaults.setObject(sentUsername, forKey: "username")
                        userDefaults.setBool(true, forKey: "loggedin")
                        //segues to profile page
                        //self.performSegueWithIdentifier("toProfile", sender: self)
                    }
                case .Failure(let error):
                    print(error)
                    self.dismissViewControllerAnimated(true, completion: nil)

                }

            }

        }

        authenticateUser(loginDetails)
        let user = NSUserDefaults.standardUserDefaults()
        let name = user.valueForKey("username") as? String

        print(name)
        // send user somewhere



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
