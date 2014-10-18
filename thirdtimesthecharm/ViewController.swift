//
//  ViewController.swift
//  Harmonize
//
//  Created by Nick Martinson on 10/17/14.
//  Copyright (c) 2014 BINI. All rights reserved.
//

import UIKit

class ViewController: UIViewController,NSURLConnectionDataDelegate,NSURLConnectionDelegate {
	
	@IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var tableView: UITableViewCell!
    @IBOutlet weak var tableView: UITableViewCell!
	var data = NSMutableData()  // Declare Globally
	var selectedIndex = -1
	var activityIndicator:UIActivityIndicatorView? = nil
	var detailItem = 1
	let url = "faseme.mybluemix.net?username=nickypoo&lat=6&lon=9"
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view, typically from a nib.
		self.showActivityIndicator()
		if detailItem==0
		{
			self.callSynchronous(url)
		}
		else if detailItem == 1
		{
			self.callAsynchronous(url)
		}
		else
		{
			self.callAsyncWithCompletionHandler(url)
		}
	}
	
	override func didReceiveMemoryWarning() {
		super.didReceiveMemoryWarning()
		// Dispose of any resources that can be recreated.
	}
	
	@IBAction func sendData(sender: AnyObject)
	{
		self.callAsynchronous(url)
	}
	
	func callSynchronous(urlString:String)
	{
		var urlString = "Your_URL_Here"
		var url = NSURL.URLWithString(urlString)// Creating URL
		var request = NSURLRequest(URL: url) // Creating Http Request
		
		var response:AutoreleasingUnsafeMutablePointer<NSURLResponse?> = nil
		var error: AutoreleasingUnsafeMutablePointer<NSErrorPointer?> = nil
		//
		//		// Sending Synchronous request using NSURLConnection
		var responseData = NSURLConnection.sendSynchronousRequest(request,returningResponse: response, error:nil) as NSData?
		//
		//		if error != nil
		//		{
		//			self.removeActivityIndicator()
		//		}
		//		else
		//		{
		//Converting data to String
		var responseStr:NSString = NSString(data:responseData!, encoding:NSUTF8StringEncoding)
		var responseDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(responseData!,options: NSJSONReadingOptions.MutableContainers, error:nil) as NSDictionary
		//			self.createWebViewLoadHTMLString(responseStr);
		//		}
	}
	
	/**
	 * Asynchronous Call with completion handler
	 */
	
	func callAsyncWithCompletionHandler(urlString:String)
	{
		println("callAsyncWithCompletionHandler")
		
		var url = NSURL.URLWithString(urlString)// Creating URL
		var request = NSURLRequest(URL: url)// Creating Http Request
		
		// Creating NSOperationQueue to which the handler block is dispatched when the request completes or failed
		var queue: NSOperationQueue = NSOperationQueue()
		
		// Sending Asynchronous request using NSURLConnection
		NSURLConnection.sendAsynchronousRequest(request, queue: queue, completionHandler:{(response:NSURLResponse!, responseData:NSData!, error: NSError!) ->Void in
			
			if error != nil
			{
				println(error.description)
				self.removeActivityIndicator()
			}
			else
			{
				var responseStr:NSString = NSString(data:responseData, encoding:NSUTF8StringEncoding)
				//var responseDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(responseData,options: NSJSONReadingOptions.MutableContainers, error:nil) as NSDictionary
				//				self.createWebViewLoadHTMLString(responseStr);
			}
		})
	}
	
	/**
	 * Asynchronous Call
	 */
	func callAsynchronous(urlString:String)
	{
		
		NSLog("connectWithUrl")
		var url = NSURL.URLWithString(urlString)// Creating URL
		var request = NSURLRequest(URL: url)// Creating Http Request
		//Making request
		var connection = NSURLConnection(request: request, delegate: self, startImmediately: true)
	}
	
	func connection(connection: NSURLConnection!, didReceiveResponse response: NSURLResponse!)
	{
		//Will be called when
		NSLog("didReceiveResponse")
	}
	
	func connection(connection: NSURLConnection!, didReceiveData _data: NSData!)
	{
		NSLog("didReceiveData")
		self.data.appendData(_data)
	}
	
	func connectionDidFinishLoading(connection: NSURLConnection!)
	{
		NSLog("connectionDidFinishLoading")
		
		var responseStr:NSString = NSString(data:self.data, encoding:NSUTF8StringEncoding)
		//var responseDict: NSDictionary = NSJSONSerialization.JSONObjectWithData(responseData,options: NSJSONReadingOptions.MutableContainers, error:nil) as NSDictionary
		//		self.createWebViewLoadHTMLString(responseStr);
	}
	
	func connection(connection: NSURLConnection!, didFailWithError error: NSError!)
	{
		NSLog("didFailWithError=%@",error)
		self.removeActivityIndicator()
	}
	
	
	/**
	 * ---------------------------- Showing Alerts ----------------------------
	 */
	
	func showActivityIndicator()
	{
		activityIndicator = UIActivityIndicatorView(activityIndicatorStyle:UIActivityIndicatorViewStyle.Gray)
		activityIndicator!.center = self.view.center
		//activityIndicator!.hidesWhenStopped = true
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
	
