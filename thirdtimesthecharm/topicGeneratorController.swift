//
//  topicGeneratorController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import Foundation
import UIKit

class topicGeneratorController: UIViewController
{
    
    
    @IBOutlet weak var closeButton: UIButton!
    
    
    
    
    
    @IBAction func closePressed(sender: AnyObject)
    {
        self.dismissViewControllerAnimated(true, completion: nil)
    }
}