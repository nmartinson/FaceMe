//
//  LoginController.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import Foundation
import UIKit
import SwiftHTTP

class LoginController: UIViewController
{
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var password: UITextField!
    @IBOutlet weak var submitButton: UIButton!
    let url = "http://hackwar.mybluemix.net/login?username="
    var activityIndicator:UIActivityIndicatorView? = nil

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func submitPressed(sender: AnyObject)
    {
        self.showActivityIndicator()
        var user = userName.text
        var pw = password.text
        
        // check for nil strings
        
        if( user != "" && pw != "")
        {
        
            var urlString = "\(url)\(user)&password=\(pw)"
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
            self.removeActivityIndicator()
        }
    }
    
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