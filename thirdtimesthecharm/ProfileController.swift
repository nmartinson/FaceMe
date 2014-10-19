//
//  ProfileController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController {
    @IBOutlet weak var editLabel: UIBarButtonItem!
    @IBOutlet weak var statusText: UITextField!
    @IBOutlet weak var hahaLabel: UILabel!
    @IBOutlet weak var tableViewContainer: UIView!
    
    var interestController:InterestTableController! = nil
    var editToggle = true
    var bioMessage = "Enter a cute little tidbit about yourself!"
    var interests = ["Coding", "THE Hawkeyes", "Puppies", "Puns", "Food", "Mountain Biking", "Golfing", "Judo", "Music", "Napping"]
    var interestValues = [false,false,false,false,false,false,false,false,false,false]

    
    var dataFromInterest:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        tableViewContainer.hidden = true
        statusText.enabled=false
        statusText.hidden = true
        hahaLabel.hidden = false
        hahaLabel.text = bioMessage
    }

    @IBAction func editPressed(sender: AnyObject)
    {
        if (editToggle == true)
        {
            editLabel.title = "Done"
            statusText.hidden = false
            statusText.enabled = true
            hahaLabel.hidden = true
            tableViewContainer.hidden = false
            
            if let viewController =  UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("Interests") as InterestTableController?{
                viewController.availableData = {[weak self]
                    (data) in
                    if let weakSelf = self{
                        println(data)
                        println("YES")
//                        weakSelf.wordEntered(data)
                    }
                }
            }
//            let storyboard = UIStoryboard(name: "Main", bundle: nil)
//            let vc = storyboard.instantiateViewControllerWithIdentifier("Interests") as InterestTableController
            
            
//            dataFromInterest = vc.hawkeyeLabel.text!
//            println(dataFromInterest)
        
        }
        else if( editToggle == false)
        {
            editLabel.title = "Edit"
            statusText.hidden = true
            statusText.enabled = false
            hahaLabel.hidden = false
            bioMessage = statusText.text
            hahaLabel.text = bioMessage
            tableViewContainer.hidden = true
        }
        editToggle = !editToggle
    }
    
    
    

    
}