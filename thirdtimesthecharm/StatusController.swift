//
//  StatusController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import UIKit
import Foundation
import SwiftHTTP

class StatusController: UIViewController {

    @IBOutlet weak var randomButton: UIButton!
    @IBOutlet weak var getCoordinates: UIButton!
    @IBOutlet weak var statusLabel: UILabel!
    
    
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

    
    //play with this for cool messages
    @IBAction func randomPressed(sender: AnyObject) {
		var my_message = randomString()
        var alert = UIAlertController(title: "Random Conversation Starter", message: my_message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Let's Do This", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
    
    @IBAction func sendCoordinates(sender: AnyObject)
    {
        var loc = geoManager.location!
        var lat = loc.coordinate.latitude
        var long = loc.coordinate.longitude
        var user:String = NSUserDefaults.standardUserDefaults().valueForKey("user_name") as String
        //        label.text = locStr
        //        println(locStr)
        
        var urlString = "\(url)\(user)&lon=\(long)&lat=\(lat)"
        println(urlString)
        
        var request = HTTPTask()
        request.GET(urlString, parameters: nil, success: {(response: HTTPResponse) in
            if response.responseObject != nil {
                let data = response.responseObject as NSData
                let str = NSString(data: data, encoding: NSUTF8StringEncoding)
                println("response: \(str)") //prints the HTML of the page
            }
            },failure: {(error: NSError) in
                println("error: \(error)")
        })
    }
    
	func randomString() ->String {
		var topics = ["The first cow milking.","What is your most embarrassing moment?", "If you were in a circus, what would your job be?", "What's the worst thing you can say on a first date?","What are things that you should not say at your own wedding?","If you could live in any home on a television series, what would it be?","What's your favorite school supply?","What's your favorite tree?","What's your least favorite word?","What's your favorite knock-knock joke?","If you could have a super power, what would it be?"]
		var i = Int(arc4random_uniform(UInt32(topics.count)))
		return topics[i]
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
