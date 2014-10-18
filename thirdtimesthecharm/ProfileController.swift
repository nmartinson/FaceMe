//
//  ProfileController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController
{
    @IBOutlet weak var editLabel: UIBarButtonItem!
    
    var editToggle = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
    }

    @IBAction func editPressed(sender: AnyObject)
    {
        println("TEST")
        if (editToggle == true)
        {
            editLabel.title = "Done"
        }
        else if( editToggle == false)
        {
            editLabel.title = "Edit"
        }
        editToggle = !editToggle
    }
    
}