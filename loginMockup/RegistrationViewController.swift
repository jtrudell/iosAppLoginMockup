//
//  RegistrationViewController.swift
//  loginMockup
//
//  Created by Jen Trudell on 11/19/15.
//  Copyright © 2015 Jen Trudell. All rights reserved.
//

import UIKit
import  SwiftyJSON
import Alamofire


class RegistrationViewController: UIViewController {

    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var confirmPassword: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    // New user registration functions
    @IBAction func registerPressed(sender: UIButton) {
        let sentFirstName = firstName.text
        let sentLastName = lastName.text
        let sentEmail = email.text
        let sentPassword = password.text
        let sentConfirmPassword = confirmPassword.text
        
        if sentPassword != sentConfirmPassword {
            //send them back to register with an error about password not matching
        } else {
            
            let registrationDetails : [String: Dictionary<String,String>] = [
                "user": [
                    "first_name": sentFirstName!,
                    "last_name": sentLastName!,
                    "email": sentEmail!,
                    "password": sentPassword!
                    ]
                ]
            
            //register using Alamofire
            
            func registerNewUser(parameters:[String:Dictionary<String,String>]) {
                let newUserUrl = "https://gentle-fortress-2146.herokuapp.com/users"
                Alamofire.request(.POST, newUserUrl, parameters: parameters)
            }
            
            registerNewUser(registrationDetails)
            print("got here")
        }
        
    }

    //goes back to login view if already a member pressed
    @IBAction func goToLogin(sender: UIButton) {
        self.dismissViewControllerAnimated(true, completion: nil)
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
