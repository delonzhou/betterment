//
//  NewWorkTableViewController.swift
//  betterment
//
//  Created by Mitul Manish on 2/04/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class NewWorkTableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var work: Work?
    @IBOutlet weak var imageView: UIImageView!

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
        imageView.contentMode = UIViewContentMode.Center
        imageView.highlighted = true
        imageView.clipsToBounds = true
        
        dismissViewControllerAnimated(true, completion: nil)
        
    }
    
    
    @IBAction func saveWork(sender: UIBarButtonItem) {
        self.work = Work(title: "Check work", description: "descrip", related_skill: "nope", images: ["noone.jpg"])
        self.performSegueWithIdentifier("backToListFromWork", sender: sender)
        
    }

}
