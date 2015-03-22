//
//  HomeViewController.swift
//  tipper
//
//  Created by Hassan Ahmad Karaouni on 3/21/15.
//  Copyright (c) 2015 Hassan A Karaouni. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {


    @IBOutlet weak var tipsterTitle: UILabel!
    @IBOutlet weak var billHeader: UILabel!
    @IBOutlet weak var tipHeader: UILabel!
    @IBOutlet weak var totalHeader: UILabel!
    
    @IBOutlet weak var perPersonHeader: UILabel!
    @IBOutlet weak var twoHeader: UILabel!
    @IBOutlet weak var threeHeader: UILabel!
    @IBOutlet weak var fourHeader: UILabel!
    
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var tipsSegment: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var totalLabel: UILabel!
    
    @IBOutlet weak var twoLabel: UILabel!
    @IBOutlet weak var threeLabel: UILabel!
    @IBOutlet weak var fourLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tipLabel.text = "$0.00"
        totalLabel.text = "$0.00"
        
        twoLabel.text = "$0.00"
        threeLabel.text = "$0.00"
        fourLabel.text = "$0.00"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func setPartyPrices(total: Double) {
        var two = total / 2.0
        var three = total / 3.0
        var four = total / 4.0
        
        twoLabel.text = String(format: "$%.2f", two)
        threeLabel.text = String(format: "$%.2f", three)
        fourLabel.text = String(format: "$%.2f", four)
    }

    @IBAction func onEditingChange(sender: AnyObject) {
        var tipPercentages = [0.18, 0.2, 0.22]
        var tipPercentage = tipPercentages[tipsSegment.selectedSegmentIndex]
        
        var billAmount = billField.text._bridgeToObjectiveC().doubleValue
        var tip = billAmount * tipPercentage
        var total = billAmount+tip
        
        setPartyPrices(total)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
    }

    
    func setFonts() {
        totalLabel.font = UIFont(name: "Roboto-Regular", size: 18)
        tipLabel.font = UIFont(name: "Roboto-Regular", size: 18)
        
        perPersonHeader.font = UIFont(name: "Roboto-Regular", size: 22)
        twoHeader.font = UIFont(name: "Roboto-Regular", size: 18)
        threeHeader.font = UIFont(name: "Roboto-Regular", size: 18)
        fourHeader.font = UIFont(name: "Roboto-Regular", size: 18)
        
        tipsterTitle.font = UIFont(name: "Harabara Mais Demo", size: 30)
        billHeader.font = UIFont(name: "Roboto-Regular", size: 18)
        tipHeader.font = UIFont(name: "Roboto-Regular", size: 18)
        totalHeader.font = UIFont(name: "Roboto-Regular", size: 18)
    }
    
    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    // Code to track controller lifecyle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("Home will appear")
        
        setFonts()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("tipsSegmentValue") != nil {
            var tipValue = defaults.objectForKey("tipsSegmentValue") as String
            tipsSegment.selectedSegmentIndex = tipValue.toInt()!
        } else {
            println("No default tip set")
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("Home did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("Home will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("Home did disappear")
    }
}

