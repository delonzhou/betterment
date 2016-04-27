//
//  RatingViewController.swift
//  betterment
//
//  Created by Mitul Manish on 27/03/2016.
//  Copyright © 2016 Mitul Manish. All rights reserved.
//

import UIKit

class RatingViewController: UIViewController {
    
    var userRating: String?
    
    
    @IBAction func ratingSelected(sender: UIButton) {
        
        switch(sender.tag){
        case 100:
            self.userRating = "neutral"
        case 200:
            self.userRating = "sad"
        case 300:
            self.userRating = "smile"
        default: break
        }
        self.performSegueWithIdentifier("unwindToDetailView", sender: sender)
    }
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
