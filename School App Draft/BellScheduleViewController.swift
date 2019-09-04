//
//  BellScheduleViewController.swift
//  SHS
//
//  Created by Ryan Lefkowitz on 11/7/17.
//  Copyright © 2017 RyanCannotDevelop. All rights reserved.
//

import UIKit

class BellScheduleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var pickerView: UIPickerView!
    
//    @IBOutlet weak var typeOfDayDisplay: UILabel!
    @IBOutlet weak var p1t: UILabel!
    @IBOutlet weak var p2t: UILabel!
    @IBOutlet weak var p3t: UILabel!
    @IBOutlet weak var p4t: UILabel!
    @IBOutlet weak var p5t: UILabel!
    @IBOutlet weak var p6t: UILabel!
    @IBOutlet weak var p7t: UILabel!
    @IBOutlet weak var p8t: UILabel!
    @IBOutlet weak var p9t: UILabel!
    
    let schedules = ["Regular", "2 Hour Delay"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return schedules[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return schedules.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(row == 0) {
            p1t.text = "7:39 AM - 8:19 AM"
            p2t.text = "8:24 AM - 9:07 AM"
            p3t.text = "9:12 AM - 9:52 AM"
            p4t.text = "9:57 AM - 10:37 AM"
            p5t.text = "10:42 AM - 11:22 AM"
            p6t.text = "11:27 AM - 12:07 PM"
            p7t.text = "12:12 PM - 12:52 PM"
            p8t.text = "12:57 PM - 1:37 PM"
            p9t.text = "1:41 PM - 2:21 PM"
        }
        else if(row == 1) {
            
            p1t.text = "9:39 AM - 10:05 AM"
            p2t.text = "10:14 AM - 10:40 AM"
            p3t.text = "10:45 AM - 11:11 AM"
            p4t.text = "11:16 AM - 11:43 AM"
            p5t.text = "11:48 AM - 12:15 PM"
            p6t.text = "12:20 PM - 12:47 PM"
            p7t.text = "12:52 PM - 1:19 PM"
            p8t.text = "1:24 PM - 1:50 PM"
            p9t.text = "1:55 PM - 2:21 PM"
        }
        else {
            
            p1t.text = ""
            p2t.text = ""
            p3t.text = ""
            p4t.text = ""
            p5t.text = ""
            p6t.text = ""
            p7t.text = ""
            p8t.text = ""
            p9t.text = ""
        }
//        typeOfDayDisplay.text = schedules[row]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        p1t.text = "7:39 AM - 8:19 AM"
        p2t.text = "8:24 AM - 9:07 AM"
        p3t.text = "9:12 AM - 9:52 AM"
        p4t.text = "9:57 AM - 10:37 AM"
        p5t.text = "10:42 AM - 11:22 AM"
        p6t.text = "11:27 AM - 12:07 PM"
        p7t.text = "12:12 PM - 12:52 PM"
        p8t.text = "12:57 PM - 1:37 PM"
        p9t.text = "1:41 PM - 2:21 PM"
//        typeOfDayDisplay.text = schedules[pickerView.selectedRow(inComponent: 0)]
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
