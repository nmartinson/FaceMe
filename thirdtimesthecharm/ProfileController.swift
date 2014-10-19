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
    
    var interestController:InterestTableController! = nil
    var editToggle = true
    var bioMessage = "Enter a cute little tidbit about yourself!"
    var interests = ["Coding", "THE Hawkeyes", "Puppies", "Puns", "Food", "Mountain Biking", "Golfing", "Judo", "Music", "Napping"]
    var interestValues = [false,false,false,false,false,false,false,false,false,false]

    
    var dataFromInterest:String = ""

    override func viewDidLoad() {
        super.viewDidLoad()
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
        }
        editToggle = !editToggle
    }
    
    
    

    
}