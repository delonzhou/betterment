//
//  DetailIncomingRequestTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 13/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import CoreData

class DetailIncomingViewController: UITableViewController {

    var detailRequest: Request?
    var requestSender: Person?
    
    
    @IBOutlet weak var proposedRateLabel: UILabel!
    
    @IBOutlet weak var messageTextLabel: UILabel!
    
    @IBOutlet weak var senderNameLabel: UILabel!
    
    @IBOutlet weak var approveButton: UIButton!
    
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchRequester((detailRequest?.requester)!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        setUpView()
        
    }
    
    private func setUpView(){
        
        if let cancelledState = detailRequest?.rejected {
            if cancelledState == 1 {
                approveButton.setTitle("Cancelled", forState: .Normal)
                approveButton.backgroundColor = UIColor.redColor()
                approveButton.userInteractionEnabled = false
            }
            else if let acceptedState = detailRequest?.accepted {
                print(acceptedState)
                if acceptedState == 1 {
                    print("inside")
                    approveButton.setTitle("Accepted", forState: .Normal)
                    approveButton.backgroundColor = UIColor.greenColor()
                    approveButton.setTitleColor(UIColor.darkGrayColor(), forState: .Normal)
                    approveButton.userInteractionEnabled = false
                }
            }
        }
        
        if let rate = detailRequest?.proposedRate?.stringValue {
            proposedRateLabel.text = "$ " + rate
        }
        
        if let message = detailRequest?.message {
            messageTextLabel.text = message
        }
        
        if let senderName = requestSender?.getfullName() {
            senderNameLabel.text = senderName
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchRequester(requester: String) {
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
       
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "userID", requester)
        
        do {
            let results = try managedObjectContext!.executeFetchRequest(fetchRequest)
            requestSender = (results as? [Person])?.first
        } catch let error as NSError {
            requestSender = nil
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    @IBAction func approveRequest(sender: UIButton) {
        
        detailRequest!.accepted = 1
        
        do{
            try managedObjectContext!.save()
        }
        catch{
            fatalError("Unable to save object")
        }
        
        approveButton.setTitle("Accepted", forState: .Normal)
        approveButton.backgroundColor = UIColor.greenColor()
        approveButton.userInteractionEnabled = false
        
        print("updating complete ....")
        
        // disable button
    }

}
