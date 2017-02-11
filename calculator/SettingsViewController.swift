//
//  SettingsViewController.swift
//  calculator
//
//  Created by Luu Tien Thanh on 2/10/17.
//  Copyright © 2017 Luu Tien Thanh. All rights reserved.
//

import UIKit

class SettingsViewController: UITableViewController {
    @IBOutlet weak var field1: UITextField!
    @IBOutlet weak var field2: UITextField!
    @IBOutlet weak var field3: UITextField!

    let defaults = UserDefaults.standard

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
        field1.placeholder = String(defaults.integer(forKey: "value_1"))
        field2.placeholder = String(defaults.integer(forKey: "value_2"))
        field3.placeholder = String(defaults.integer(forKey: "value_3"))
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Percentage"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillDisappear(_ animated: Bool) {
        let valueSetting1 = Int(field1.text!)
        let valueSetting2 = Int(field2.text!)
        let valueSetting3 = Int(field3.text!)
        
        if( nil != valueSetting1) {
            defaults.set(valueSetting1!, forKey: "value_1")
        }
        
        if( nil != valueSetting2) {
            defaults.set(valueSetting2!, forKey: "value_2")
        }
        
        if( nil != valueSetting3) {
            defaults.set(valueSetting3!, forKey: "value_3")
        }
        
    }
    
}
