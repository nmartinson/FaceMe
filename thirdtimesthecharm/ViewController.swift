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
    let urlString = "http://hackwar.mybluemix.net/PingLocation?username=data&lon=5&lat=6"
    
    lazy var geoManager = GeoManager.sharedInstance
    
	override func viewDidLoad() {
		super.viewDidLoad()
        self.geoManager.start()

	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
    @IBAction func sendDatas(sender: AnyObject)
    {
        
        var loc = geoManager.location
        var locStr:String = "\(loc?.coordinate.latitude)"
        label.text = locStr
        println(locStr)
        
//        var urlString = "\(url)\(user)&password=\(pw)"
//        println(urlString)
        
//        var request = HTTPTask()
//        request.GET(urlString, parameters: nil, success: {(response: HTTPResponse) in
//            if response.responseObject != nil {
//                let data = response.responseObject as NSData
//                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
//                println("response: \(str)") //prints the HTML of the page
//            }
//            },failure: {(error: NSError) in
//                println("error: \(error)")
//        })
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
	
