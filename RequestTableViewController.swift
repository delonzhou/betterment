//
//  RequestTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 16/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import CoreData

class RequestTableViewController: UITableViewController {

    var person: Person?
    var skill: Skill?
    
    
    @IBOutlet weak var hourlyRate: UITextField!
    
    @IBOutlet weak var message: UITextField!
    
    
    @IBOutlet weak var sendRequestButton: UIButton!
    
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveNewRequest(sender: UIButton) {
        
        let requestEntity = NSEntityDescription.insertNewObjectForEntityForName("Request", inManagedObjectContext: managedObjectContext!) as! Request
        
        requestEntity.setValue(CURRENT_USER, forKey: "requester")
        
        if let requestee = person?.userID{
          requestEntity.setValue(requestee, forKey: "requestee")
        }
        
        if let skillName = skill?.skillName {
            requestEntity.setValue(skillName, forKey: "skillName")
        }
        
        let hourlyRateInput = hourlyRate.text
        if let number = Int(hourlyRateInput!) {
            let proposedRate = NSNumber(integer: number)
            
            requestEntity.setValue(proposedRate, forKey: "proposedRate")
            
        } else {
            print("'\(hourlyRateInput)' did not convert to an Int")
        }
        
        if let message = self.message.text {
            requestEntity.setValue(message, forKey: "message")
        }
        
        requestEntity.setValue(0, forKey: "accepted")
        requestEntity.setValue(0, forKey: "rejected")
        
        print("Saving Request")
        do{
            try managedObjectContext!.save()
        }
        catch{
            fatalError("Unable to save object")
        }
        print("Done Saving Request")
        
        sendRequestButton.setTitle("Request Sent", forState: .Normal)
        sendRequestButton.userInteractionEnabled = false
    }

}
