//
//  ViewController.swift
//  Library App
//
//  Created by Phillip LeMaster on 5/14/18.
//  Copyright © 2018 Phillip LeMaster. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController, MKMapViewDelegate {
    @IBOutlet weak var mapView: MKMapView!
    //region radius of the map view
    let regionRadius: CLLocationDistance = 500000
    let locationManager = CLLocationManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let initialLocation = CLLocation(latitude: 37.4316, longitude: -78.6569)
        centerMapOnLocation(location: initialLocation)
        
        //requests always authorization
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.requestAlwaysAuthorization()
        
        
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //tells view to autorotate
    override var shouldAutorotate : Bool {
        return true
    }
    
    //overrides which rotations are available
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .portrait
    }

    func centerMapOnLocation(location: CLLocation){
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, regionRadius, regionRadius)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    
}

