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
    let url = "http://hackwar.mybluemix.net/PingLocation?username="
    
    var geoManager = GeoManager.sharedInstance
    
	override func viewDidLoad() {
		super.viewDidLoad()
        geoManager.startStandardUpdates()

	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
		
}
	
