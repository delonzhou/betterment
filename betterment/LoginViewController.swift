//
//  LoginViewController.swift
//  betterment
//
//  Created by Mitul Manish on 21/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var passwordLabel: UITextField!
    @IBOutlet weak var signoutButton: UIButton!
     @IBOutlet weak var usernameLabel: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        
        if (CURRENT_USER.authData != nil){
          print("User logged in: \(CURRENT_USER.authData.uid)")
            self.signoutButton.hidden = false
        }
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        
        let email = usernameLabel.text
        let password = passwordLabel.text
        
        if(email != nil && password != nil){
            FIREBASE_REF.authUser(email, password: password, withCompletionBlock: { (error, authData) -> Void in
                
                if(error == nil){
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    print("Current User siging in: \(CURRENT_USER.authData.uid)")
                    self.navigateMain()
                }
                else{
                    print ("Something went wrong: \(error)")
                }
            })
        }
        else{
            print ("Notify user with message")
        }
    }
    
    
    
    @IBAction func signOutAction(sender: AnyObject) {
        CURRENT_USER.unauth()
        self.signoutButton.hidden = true
        print("User Signed out")
    }
    
    func navigateMain(){
         self.performSegueWithIdentifier("loginSegue", sender: self)
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
