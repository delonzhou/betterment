//
//  NewWorkTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 2/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit
import CoreData

class NewWorkTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    let managedObjectContext = (UIApplication.sharedApplication().delegate as?
        AppDelegate)?.managedObjectContext
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var relatedSkill: UITextField!
    @IBOutlet weak var workDescription: UITextField!
    @IBOutlet weak var workTitle: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0){
            if ( UIImagePickerController.isSourceTypeAvailable(.PhotoLibrary)){
                let imagePicker = UIImagePickerController()
                imagePicker.delegate = self
                imagePicker.allowsEditing = false
                imagePicker.sourceType = .PhotoLibrary
                self.presentViewController(imagePicker, animated: true, completion: nil)
            }
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        
        imageView.image = info[UIImagePickerControllerOriginalImage] as? UIImage
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.clipsToBounds = true
        
        let leadingConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Leading, multiplier: 1, constant: 0)
        leadingConstraint.active = true
        
        let trailingConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Trailing, multiplier: 1, constant: 0)
        trailingConstraint.active = true
        
        let topConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Top, multiplier: 1, constant: 0)
        topConstraint.active = true
        
        let bottomConstraint = NSLayoutConstraint(item: imageView, attribute: NSLayoutAttribute.Bottom, relatedBy: NSLayoutRelation.Equal, toItem: imageView.superview, attribute: NSLayoutAttribute.Bottom, multiplier: 1, constant: 0)
        bottomConstraint.active = true
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func saveWork(sender: UIBarButtonItem) {
        
        print("finding User")
        
        let fetchRequest = NSFetchRequest(entityName: "Person")
        fetchRequest.predicate = NSPredicate(format: "%K == %@", "userID", CURRENT_USER!)
        
        //3
        var fetchedUsers = [Person]()
        do {
            let results =
                try managedObjectContext!.executeFetchRequest(fetchRequest)
            fetchedUsers = (results as?[
                Person])!
            
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
        let associatedUser = fetchedUsers.first
        
        print("User found")
        
        let workEntity = NSEntityDescription.insertNewObjectForEntityForName("Work", inManagedObjectContext: managedObjectContext!) as! Work
        
        workEntity.setValue(self.workTitle.text, forKey: "workTitle")
        workEntity.setValue(self.workDescription.text, forKey: "workDescription")
        workEntity.setValue(self.relatedSkill.text, forKey: "relatedSkill")
        
        if let workImage = imageView.image {
            workEntity.workImage = UIImagePNGRepresentation(workImage)
        }
        
        
        workEntity.owner = associatedUser
        
        print("Saving Work")
        do{
            try managedObjectContext!.save()
        }
        catch{
            fatalError("Unable to save object")
        }
        print("Done Saving Work")
        
        self.performSegueWithIdentifier("backToListFromWork", sender: sender)
        
    }
    
}
