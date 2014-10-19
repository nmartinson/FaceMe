//
//  TableViewController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import Foundation
import UIKit

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var randomToggle: UISwitch!
    @IBOutlet weak var visibilityButton: UIImageView!
    @IBOutlet weak var randomSwitch: UISwitch!
    @IBOutlet weak var randomLable: UIBarButtonItem!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let notVisibileIMG = UIImage(named: "glyphicons_0_eye_close.png") as UIImage
    let visibileIMG = UIImage(named: "glyphicons_0_eye_open.png") as UIImage
    var items: [String] = ["We", "Heart", "Swift"]
    var visibilityToggle = true

    
    override func viewDidLoad() {
        super.viewDidLoad()
        visibilityButton.image = notVisibileIMG
        activityIndicator.hidden = true
        randomSwitch.on = false
        self.tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.items.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell:UITableViewCell = self.tableView.dequeueReusableCellWithIdentifier("cell") as UITableViewCell
        
        cell.textLabel!.text = self.items[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("profile", sender: self)
    }
	
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "profile"
        {
            let profileViewController = segue.destinationViewController as ProfileController
            
        }
    }
    @IBAction func visibilityButtonPressed(sender: AnyObject) {
        if (visibilityToggle == true)
        {
            visibilityButton.image = visibileIMG

        }
        else if( visibilityToggle == false)
        {
            visibilityButton.image = notVisibileIMG
        }
        visibilityToggle = !visibilityToggle

    }

    @IBAction func profilePressed(sender: AnyObject)
    {
        println("profile pressed")

    }
    

    @IBAction func notificationPressed(sender: AnyObject)
    {
        println("Notifications")

    }

    @IBAction func randomSwitchChanged(sender: AnyObject)
    {
        if randomSwitch.on
        {
            self.showActivityIndicator()
            randomLable.title = "Looking     "
//            randomLable.title = "Searching.."
        }
        else
        {
            self.removeActivityIndicator()
            randomLable.title = "Random    "
        }
    }
    
    func showActivityIndicator()
    {
        activityIndicator.hidden = false
//        activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:UIActivityIndicatorViewStyle.Gray)
//        activityIndicator!.center = self.view.center
//        self.view.addSubview(activityIndicator!)
        activityIndicator!.startAnimating()
    }
    
    func removeActivityIndicator()
    {
        if (activityIndicator != nil)
        {
            activityIndicator!.stopAnimating()
            activityIndicator.hidden = true
        }
    }
}