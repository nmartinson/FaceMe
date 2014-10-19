//
//  GPSSingleton.swift
//  thirdtimesthecharm
//
//  Created by Bridget on 10/18/14.
//  Copyright (c) 2014 Bridget. All rights reserved.
//

import Foundation


//
//  GeoManager.swift
//  WikiLocation
//
//  Created by Christian Menschel on 29.06.14.
//  Copyright (c) 2014 enterprise. All rights reserved.
//

import Foundation
import CoreLocation

public class GeoManager : NSObject, CLLocationManagerDelegate {
    

    //MARK: - Properties
    public var locationManager:CLLocationManager = CLLocationManager()
    //private(set)  var location:CLLocation?
    public var location:CLLocation?
    var locationAuthorized = false
    public class var sharedInstance: GeoManager {
    struct SharedInstance {
        static let instance = GeoManager()
        }
        return SharedInstance.instance
    }
    
    
    func startStandardUpdates()
    {
        
        if(locationManager.isEqual(nil))
        {
            locationManager = CLLocationManager()
        }
        locationManager.requestAlwaysAuthorization()
        locationManager.requestWhenInUseAuthorization()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.distanceFilter = 500
        locationManager.startUpdatingLocation()
        
    }
    
    public func locationManager(manager: CLLocationManager!, didUpdateLocations locations: [AnyObject]!) {
        var loc: CLLocation = locations.last as CLLocation
        var eventDate = loc.timestamp
        var howRecent = eventDate.timeIntervalSinceNow
        if(abs(howRecent) < 15 )
        {
            self.location = loc
            println(loc.coordinate.latitude)
        }
        

    }
}