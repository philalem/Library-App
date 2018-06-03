//
//  ViewController.swift
//  Library App
//
//  Created by Phillip LeMaster on 5/14/18.
//  Copyright © 2018 Phillip LeMaster. All rights reserved.
//

import UIKit
import MapKit

class ViewController: UIViewController {
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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

    
    
}

