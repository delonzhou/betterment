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
    
    override func prefersStatusBarHidden() -> Bool {
        return true;
    }
    
    @IBAction func loginAction(sender: AnyObject) {
        
        let email = usernameLabel.text
        let password = passwordLabel.text
        
        let finalEmail = email!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        let finalPassword = password!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
        
        if(finalEmail.isEmpty && finalPassword.isEmpty){
            print("Email and password are empty")
            
            let alertController = UIAlertController(title: "Invalid", message: "Email and Password empty", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        else if(finalEmail.isEmpty){
            let alertController = UIAlertController(title: "Invalid", message: "Email is empty", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if (finalPassword.isEmpty){
            let alertController = UIAlertController(title: "Invalid", message: "Password is empty", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if(finalEmail.characters.count < 10){
            let alertController = UIAlertController(title: "Invalid", message: "Email must not be less than 10 characters", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if (finalPassword.characters.count < 8){
            let alertController = UIAlertController(title: "Invalid", message: "Password must not be less than 8 characters", preferredStyle: .Alert)
            
            let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alertController.addAction(defaultAction)
            
            presentViewController(alertController, animated: true, completion: nil)
        }
        else{
            
            FIREBASE_REF.authUser(finalEmail, password: finalPassword, withCompletionBlock: { (error, authData) -> Void in
                
                if(error == nil){
                    NSUserDefaults.standardUserDefaults().setValue(authData.uid, forKey: "uid")
                    print("Current User siging in: \(CURRENT_USER.authData.uid)")
                    self.navigateMain()
                }
                else{
                    let alertController = UIAlertController(title: "Invalid", message: "Email or password is wrong", preferredStyle: .Alert)
                    
                    let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
                    alertController.addAction(defaultAction)
                    
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
            
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
