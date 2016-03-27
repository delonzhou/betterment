//
//  NewSkillViewController.swift
//  betterment
//
//  Created by Mitul Manish on 28/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class NewSkillViewController: UIViewController {
    
  
    @IBOutlet weak var skillName: UITextField!
    
    
    @IBOutlet weak var experience: UITextField!
    
    
    @IBOutlet weak var hourlyRate: UITextField!
    
    var skill_name: String?
    var experience_years: String?
    var rate_hourly: String?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
    
    @IBAction func saveSkill(sender: AnyObject) {
        skill_name = skillName.text
        experience_years = experience.text
        rate_hourly = hourlyRate.text
        performSegueWithIdentifier("rewindSegue", sender: sender)
    }
    

}
