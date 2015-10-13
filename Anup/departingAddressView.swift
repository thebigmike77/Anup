//
//  departingAddressView.swift
//  Anup
//
//  Created by Michael BECK on 10/13/15.
//  Copyright (c) 2015 Euro Management Consulting S.A. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class departingAddressView: UIViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var map: MKMapView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        var latitude:CLLocationDegrees = 43.095181
        
        var longitude:CLLocationDegrees = -79.006424
        
        var latDelta:CLLocationDegrees = 0.05
        
        var lonDelta:CLLocationDegrees = 0.05
        
        var span:MKCoordinateSpan = MKCoordinateSpanMake(latDelta, lonDelta)
        
        var location:CLLocationCoordinate2D = CLLocationCoordinate2DMake(latitude, longitude)
        
        var region:MKCoordinateRegion = MKCoordinateRegionMake(location, span)
        
        map.setRegion(region, animated: false)
        

        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

