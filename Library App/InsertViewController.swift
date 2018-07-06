//
//  InsertViewController.swift
//  Library App
//
//  Created by Phillip LeMaster on 6/19/18.
//  Copyright © 2018 Phillip LeMaster. All rights reserved.
//

import UIKit
import RealmSwift

class InsertViewController: UIViewController{
    
    var incomingLib: Library? = nil
    let realm = try! Realm()
    
    @IBOutlet var libraryNameTextField: UITextField!
    @IBOutlet var librarySwitch: UISwitch!
    
    
    @IBAction func doneButtonAction(_ sender: Any) {
        
        if let goodLib = incomingLib{
            try! realm.write {
                goodLib.name = libraryNameTextField.text!
                goodLib.crowd = librarySwitch.isOn
                goodLib.floors = 0
                goodLib.food = false
                goodLib.created = NSDate()
            }
        }
        else {
            let lib = Library()
            lib.name = libraryNameTextField.text!
            lib.crowd = librarySwitch.isOn
            lib.floors = 0
            lib.food = false
            lib.created = NSDate()
            
            try! realm.write {
                realm.add(lib)
            }
        }

        navigationController?.popViewController(animated: true)
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let goodLib = incomingLib{
            libraryNameTextField.text = goodLib.name
            librarySwitch.isOn = goodLib.crowd
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
}
