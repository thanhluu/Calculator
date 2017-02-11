//
//  ViewController.swift
//  calculator
//
//  Created by Luu Tien Thanh on 2/10/17.
//  Copyright © 2017 Luu Tien Thanh. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var peopleField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    var value1 = Int()
    var value2 = Int()
    var value3 = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        tipLabel.text = formatter.string(from: NSNumber(value: 0))
        totalLabel.text = formatter.string(from: NSNumber(value: 0))
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.billField.becomeFirstResponder()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let defaults = UserDefaults.standard
        value1 = defaults.integer(forKey: "value_1")
        value2 = defaults.integer(forKey: "value_2")
        value3 = defaults.integer(forKey: "value_3")
        
        defaults.synchronize()
        tipControl.setTitle(String(format: "%d%%", value1), forSegmentAt: 0)
        tipControl.setTitle(String(format: "%d%%", value2), forSegmentAt: 1)
        tipControl.setTitle(String(format: "%d%%", value3), forSegmentAt: 2)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        let tipPercentages = [0.18, 0.2, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        let people = Double(peopleField.text!) ?? 1
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex] / people
        let total = bill / people + tip
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = Locale.current
        
        tipLabel.text = formatter.string(from: NSNumber(value: tip))
        totalLabel.text = formatter.string(from: NSNumber(value: total))
    }
}

