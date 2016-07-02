//
//  DetailOutgoingViewController.swift
//  betterment
//
//  Created by Mitul Manish on 13/05/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import CoreData

class DetailOutgoingViewController: UITableViewController {

    var detailRequest: Request?
    var requestReceiver: Person?
    
    
    @IBOutlet weak var proposedRateLabel: UILabel!
    
    @IBOutlet weak var messageTextLabel: UILabel!
    
    @IBOutlet weak var receiverNameLabel: UILabel!
    
    @IBOutlet weak var declineButton: UIButton!
    
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchReceiver((detailRequest?.requestee)!)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(true)
        setUpView()
        
    }
    
    private func setUpView(){
        
        if let acceptedState = detailRequest?.accepted {
            if acceptedState == 1 {
                declineButton.setTitle("Accepted", forState: .Normal)
                declineButton.backgroundColor = UIColor.greenColor()
                declineButton.userInteractionEnabled = false
            }
            else if let rejectedState = detailRequest?.rejected {
                if rejectedState == 1 {
                    declineButton.setTitle("Rejected", forState: .Normal)
                    declineButton.userInteractionEnabled = false
                }
            }
        }
       
        
        if let rate = detailRequest?.proposedRate?.stringValue {
            proposedRateLabel.text = "$ " + rate
        }
        
        if let message = detailRequest?.message {
            messageTextLabel.text = message
        }
        
        if let senderName = requestReceiver?.getfullName() {
            receiverNameLabel.text = senderName
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func fetchReceiver(requestee: String) {
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "userID", requestee)
        
        do {
            let results = try managedObjectContext!.executeFetchRequest(fetchRequest)
            requestReceiver = (results as? [Person])?.first
        } catch let error as NSError {
            requestReceiver = nil
            print("Could not fetch \(error), \(error.userInfo)")
        }
    }
    
    
    @IBAction func rejectRequest(sender: UIButton) {
        
        detailRequest!.rejected = 1
        
        do{
            try managedObjectContext!.save()
        }
        catch{
            fatalError("Unable to save object")
        }
        
        declineButton.userInteractionEnabled = false
        
        print("updating complete ....")
        
         // disable button
        declineButton.setTitle("Rejected", forState: .Normal)
        declineButton.userInteractionEnabled = false
        
       
    }

}
