//
//  InterestTableController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import Foundation
import UIKit

class InterestTableController: UITableViewController
{
    @IBOutlet weak var musicLabel: UILabel!
    @IBOutlet weak var golfLabel: UILabel!
    @IBOutlet weak var bikingLabel: UILabel!
    @IBOutlet weak var foodLabel: UILabel!
    @IBOutlet weak var punsLabel: UILabel!
    @IBOutlet weak var puppyLabel: UILabel!
    @IBOutlet weak var napsLabel: UILabel!
    @IBOutlet weak var codingLabel: UILabel!
    @IBOutlet weak var hawkeyeLabel: UILabel!
    @IBOutlet weak var hawkeyeSwitch: UISwitch!
    @IBOutlet weak var codingSwitch: UISwitch!
    @IBOutlet weak var napSwitch: UISwitch!
    @IBOutlet weak var puppySwitch: UISwitch!
    @IBOutlet weak var golfSwitch: UISwitch!
    @IBOutlet weak var punSwitch: UISwitch!
    @IBOutlet weak var musicSwitch: UISwitch!
    @IBOutlet weak var foodSwitch: UISwitch!
    @IBOutlet weak var bikingSwitch: UISwitch!
//    @IBOutlet var tableView: UITableView!
    var availableData: ((data:String) -> ())?


    override func viewDidLoad() {
        super.viewDidLoad()
//        println(hawkeyeLabel.text!)
        self.availableData?(data: hawkeyeLabel.text!)
        
    }

//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//
//        let profileController = segue.destinationViewController as ProfileController
//        profileController.dataFromInterest = hawkeyeLabel.text!
//        println(hawkeyeLabel.text!)
//    }

    

}