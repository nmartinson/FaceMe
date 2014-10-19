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
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var waterLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var dancingLabel: UILabel!
    @IBOutlet weak var punLabel: UILabel!
    @IBOutlet weak var rockLabel: UILabel!
    @IBOutlet weak var golfLabel: UILabel!
    @IBOutlet weak var napLabel: UILabel!
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var bikeLabel: UILabel!
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var hawkLabel: UILabel!
    @IBOutlet weak var hawkeyeButton: UISwitch!
    @IBOutlet weak var codingButton: UISwitch!
    @IBOutlet weak var bikingButton: UISwitch!
    @IBOutlet weak var musicButton: UISwitch!
    @IBOutlet weak var nappButton: UISwitch!
    @IBOutlet weak var golfButton: UISwitch!
    @IBOutlet weak var punsButton: UISwitch!
    @IBOutlet weak var rockButton: UISwitch!
    @IBOutlet weak var danceButton: UISwitch!
    @IBOutlet weak var foodButton: UISwitch!
    @IBOutlet weak var waterButton: UISwitch!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    var interestController:InterestTableController! = nil
    var editToggle = true
    var bioMessage = "Enter a cute little tidbit about yourself!"
    var interests = [ "Hawkeyes", "Coding", "Mountain Biking","Music","Napping In Public","Golf","Rock Climbing", "Puns", "Dancing",   "Food", "Water" ]
    var interestValues = [false,false,false,false,false,false,false,false,false,false, false]
    var buttonArray: [UISwitch]
    
//    buttonArray = [ hawkeyeButton, codingButton, bikingButton, musicButton,nappButton, golfButton, rockButton, punsButton, danceButton, foodButton, waterButton]
    
    var dataFromInterest:String = ""

    override func viewDidLoad() {
        //super.viewDidLoad()
        nameLabel.text = NSUserDefaults.standardUserDefaults().valueForKey("user_name") as? String
        scrollView.contentSize = CGSize(width: 300, height: 550)        
        scrollView.hidden = true
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
            scrollView.hidden = false
            

        
        }
        else if( editToggle == false)
        {
            editLabel.title = "Edit"
            statusText.hidden = true
            statusText.enabled = false
            hahaLabel.hidden = false
            bioMessage = statusText.text
            hahaLabel.text = bioMessage
            scrollView.hidden = true
//            for item in buttonArray
//            {
//                item
//            }
        }
        editToggle = !editToggle
    }
    
    
    

    
}