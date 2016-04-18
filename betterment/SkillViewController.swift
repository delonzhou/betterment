//
//  SkillViewController.swift
//  betterment
//
//  Created by Mitul Manish on 22/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class SkillViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    var user: Person?
    var skill: [Skill]?
    @IBOutlet var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return user!.skill.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath:
        NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell",
        forIndexPath: indexPath) as? SkillTableViewCell
        // Configure the cell...
        let rate = NSString(format: "%.2f", user!.skill[indexPath.row].hourly_rate!)
        print(rate)
        //cell?.experienceLabel.text = String(user!.skill[indexPath.row].experience!) + " Years"
        //cell?.hourlyRateLabel.text =  NSString(format: "%.2f", user!.skill[indexPath.row].hourly_rate!) as String
        //cell?.skillImage.image = UIImage(named: "sportsguidance")
        cell?.skillImage.image = UIImage(named: user!.skill[indexPath.row].skill_image!)
        cell?.skillNameLabel.text = user!.skill[indexPath.row].skill_name
        print(user!.skill[indexPath.row].skill_name)
        cell?.experienceLabel.text = String(user!.skill[indexPath.row].experience!) + " Years"
        cell?.hourlyRateLabel.text = "$ " + (NSString(format: "%.2f", user!.skill[indexPath.row].hourly_rate!) as String) as String + " Per Hour"
        return cell!
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
