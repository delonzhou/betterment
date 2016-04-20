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
        let defaultAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
        
        if(finalEmail.isEmpty && finalPassword.isEmpty){
            print("Email and password are empty")
            
            let alertController = self.prepareAlertController("Invalid", messageContent: "Email and Password empty")
            
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
            
        }
        else if(finalEmail.isEmpty){
            let alertController = self.prepareAlertController("Invalid", messageContent:  "Email is empty")
            
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if (finalPassword.isEmpty){
            let alertController = self.prepareAlertController("Invalid", messageContent:  "Password is empty")
           
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if(finalEmail.characters.count < 10){
            let alertController = self.prepareAlertController("Invalid", messageContent: "Email must not be less than 10 characters")
            
            alertController.addAction(defaultAction)
            presentViewController(alertController, animated: true, completion: nil)
        }
        else if (finalPassword.characters.count < 8){
            let alertController = self.prepareAlertController("Invalid", messageContent: "Password must not be less than 8 characters")
            
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
                    let alertController = self.prepareAlertController("Invalid", messageContent: "Email or password is wrong")
                    
                    alertController.addAction(defaultAction)
                    self.presentViewController(alertController, animated: true, completion: nil)
                }
            })
            
        }
    }
    
    private func prepareAlertController(messageTitle: String, messageContent: String) -> UIAlertController {
       
        return UIAlertController(title: messageTitle, message: messageContent, preferredStyle: .Alert)
    }
    
    
    
    @IBAction func signOutAction(sender: AnyObject) {
        CURRENT_USER.unauth()
        self.signoutButton.hidden = true
        print("User Signed out")
    }
    
    func navigateMain(){
         self.performSegueWithIdentifier("loginSegue", sender: self)
    }
    
}
