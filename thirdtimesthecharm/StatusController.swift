//
//  StatusController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import UIKit
import Foundation

class StatusController: UIViewController {

    @IBOutlet weak var randomButton: UIButton!

    @IBOutlet weak var statusLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    //play with this for cool messages
    @IBAction func randomPressed(sender: AnyObject) {
		var my_message = randomString()
        var alert = UIAlertController(title: "Random Conversation Starter", message: my_message, preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "Let's Do This", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
    }
	func randomString() ->String {
		var topics = ["The first cow milking.","What is your most embarrassing moment?", "If you were in a circus, what would your job be?", "What's the worst thing you can say on a first date?","What are things that you should not say at your own wedding?","If you could live in any home on a television series, what would it be?","What's your favorite school supply?","What's your favorite tree?","What's your least favorite word?","What's your favorite knock-knock joke?","If you could have a super power, what would it be?"]
		var i = Int(arc4random_uniform(UInt32(topics.count)))
		return topics[i]
	}
}
