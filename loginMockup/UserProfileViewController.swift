//
//  UserProfileViewController.swift
//  loginMockup
//
//  Created by Jen Trudell on 11/20/15.
//  Copyright © 2015 Jen Trudell. All rights reserved.
//

import UIKit

class UserProfileViewController: UIViewController {

    @IBOutlet weak var welcomeLabel: UILabel!
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //let email = NSUserDefaults.standardUserDefaults().valueForKey("username") as! String
        
        let userName = NSUserDefaults.standardUserDefaults().objectForKey("name") as! String
        welcomeLabel.text = "hi my name \(userName)"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
