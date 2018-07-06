//
//  ViewController.swift
//  Library App
//
//  Created by Phillip LeMaster on 5/14/18.
//  Copyright © 2018 Phillip LeMaster. All rights reserved.
//

import UIKit
import MapKit
import RealmSwift

var Libraries: Results<Library>!
var realm = try! Realm()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    let locationManager = CLLocationManager()

    @IBOutlet var libraryTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Libraries = realm.objects(Library.self)
        libraryTableView.dataSource = self
        libraryTableView.delegate = self
        locationManager.delegate = self as? CLLocationManagerDelegate
        locationManager.requestAlwaysAuthorization()
        reload()
       
    }
    
    //ensures view appears when adding to table
    override func viewWillAppear(_ animated: Bool) {
        reload()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LibraryClick"{
            let destination = segue.destination as! InsertViewController
            let lib = Libraries[libraryTableView.indexPathForSelectedRow!.row]
            destination.incomingLib = lib
        }
    }
    
    //tells view to autorotate
    override var shouldAutorotate : Bool {
        return true
    }
    
    //overrides which rotations are available
    override var supportedInterfaceOrientations : UIInterfaceOrientationMask {
        return .portrait
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryCell", for: indexPath) as! LibCell
        let lib = Libraries[indexPath.row]
        cell.LibraryName.text = lib.name
        cell.LibraryCrowdDisplay.text = lib.crowd ? "Crowded" : "Not Crowded"
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Libraries.count
    }
    
    //releads data into table
    func reload(){
        libraryTableView.reloadData()
    }
    
    //deletes the libraries. To be removed later
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            try! realm.write {
                realm.delete(Libraries[indexPath.row])
            }
            reload()
        }
    }
    
}



class LibCell: UITableViewCell{
    @IBOutlet weak var LibraryName: UILabel!
    @IBOutlet weak var LibraryCrowdDisplay: UILabel!

}

