//
//  SettingsViewController.swift
//  tipper
//
//  Created by Hassan Ahmad Karaouni on 3/21/15.
//  Copyright (c) 2015 Hassan A Karaouni. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var settingsTitle: UILabel!
    @IBOutlet weak var defaultHeader: UILabel!

    @IBOutlet weak var settingsTipSegment: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func settingsTipSegmentChanged(sender: AnyObject) {
        var index = settingsTipSegment.selectedSegmentIndex
        println("Settings Tip Segment Changed to \(index)")
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setObject("\(index)", forKey: "tipsSegmentValue")
        defaults.synchronize()
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func setFonts() {
        settingsTitle.font = UIFont(name: "Roboto-Regular", size: 24)
        defaultHeader.font = UIFont(name: "Roboto-Regular", size: 18)
    }
    
    // Code to track controller lifecyle
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        println("Settings will appear")
        
        setFonts()
        
        var defaults = NSUserDefaults.standardUserDefaults()
        if defaults.objectForKey("tipsSegmentValue") != nil {
            var tipValue = defaults.objectForKey("tipsSegmentValue") as String
            settingsTipSegment.selectedSegmentIndex = tipValue.toInt()!
        } else {
            settingsTipSegment.selectedSegmentIndex = UISegmentedControlNoSegment;
        }
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        println("Settings did appear")
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        println("Settings will disappear")
    }
    
    override func viewDidDisappear(animated: Bool) {
        super.viewDidDisappear(animated)
        println("Settings did disappear")
    }
}
