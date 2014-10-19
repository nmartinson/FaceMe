//
//  ViewController.swift
//  Harmonize
//
//  Created by Nick Martinson on 10/17/14.
//  Copyright (c) 2014 BINI. All rights reserved.
//

import UIKit
import SwiftHTTP

class ViewController: UIViewController {
	
	@IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var label: UILabel!

	var data = NSMutableData()  // Declare Globally
	var selectedIndex = -1
	var activityIndicator:UIActivityIndicatorView? = nil
	var detailItem = 1
	let urlString = "http://hackwar.mybluemix.net/credentials?username=&password="
//    let urlString = "http://hackwar.mybluemix.net/PingLocation?username=data&lon=5&lat=6"
    
	override func viewDidLoad() {
		super.viewDidLoad()


	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
    @IBAction func sendDatas(sender: AnyObject)
    {
        
    }
	
	
	
	/**
	 * ---------------------------- Showing Alerts ----------------------------
	 */
	
	func showActivityIndicator()
	{
		activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:UIActivityIndicatorViewStyle.Gray)
		activityIndicator!.center = self.view.center
		self.view.addSubview(activityIndicator!)
		activityIndicator!.startAnimating()
	}
	
	func removeActivityIndicator()
	{
		if (activityIndicator != nil)
		{
			activityIndicator!.stopAnimating()
		}
	}
	
}
	
