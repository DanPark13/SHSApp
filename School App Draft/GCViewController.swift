//
//  GCViewController.swift
//  SHS
//
//  Created by Ryan Lefkowitz on 10/17/17.
//  Copyright © 2017 RyanCannotDevelop. All rights reserved.
//

import UIKit

class GCViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {

    @IBOutlet weak var gq1disp: UILabel!
    @IBOutlet weak var gq2disp: UILabel!
    @IBOutlet weak var gq3disp: UILabel!
    @IBOutlet weak var gq4disp: UILabel!
    @IBOutlet weak var gmtdisp: UILabel!
    @IBOutlet weak var gfldisp: UILabel!
    
    @IBOutlet weak var cq1: UIButton!
    @IBOutlet weak var cq2: UIButton!
    @IBOutlet weak var cq3: UIButton!
    @IBOutlet weak var cq4: UIButton!
    @IBOutlet weak var cmt: UIButton!
    @IBOutlet weak var cfl: UIButton!
    
    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var GCOutput: UILabel!
    @IBOutlet weak var ygi: UILabel!
    
    var q1used = false
    var q2used = false
    var q3used = false
    var q4used = false
    var mtused = false
    var flused = false
    
    var currentSelected = -1
    
    let grades = ["None", "A+", "A", "B+", "B", "C+", "C", "D", "F"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int
    {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return grades[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return grades.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(currentSelected == 0) {
            if(grades[row] != "None") {
                q1used = true
                gq1disp.text = grades[row]
            }
            else {
                q1used = false
                gq1disp.text = ""
            }
        }
        if(currentSelected == 1) {
            if(grades[row] != "None") {
                q2used = true
                gq2disp.text = grades[row]
            }
            else {
                q2used = false
                gq2disp.text = ""
            }
        }
        if(currentSelected == 2) {
            if(grades[row] != "None") {
                q3used = true
                gq3disp.text = grades[row]
            }
            else {
                q3used = false
                gq3disp.text = ""
            }
        }
        if(currentSelected == 3) {
            if(grades[row] != "None") {
                q4used = true
                gq4disp.text = grades[row]
            }
            else {
                q4used = false
                gq4disp.text = ""
            }
        }
        if(currentSelected == 4) {
            if(grades[row] != "None") {
                mtused = true
                gmtdisp.text = grades[row]
            }
            else {
                mtused = false
                gmtdisp.text = ""
            }
        }
        if(currentSelected == 5) {
            if(grades[row] != "None") {
                flused = true
                gfldisp.text = grades[row]
            }
            else {
                flused = false
                gfldisp.text = ""
            }
        }
        updateGradeDisp()
    }
    
    @IBAction func cq1press(_ sender: UIButton) {
        if(currentSelected == -1) {
            cq1.setTitle("Done", for: .normal)
            currentSelected = 0
            pickerView.selectRow(intFromStr(gq1disp.text!), inComponent: 0, animated: false)
            pickerView.isHidden = false
        }
        else if(currentSelected == 0) {
            pickerView.isHidden = true
            currentSelected = -1
            cq1.setTitle("Edit", for: .normal)
        }
        else {
            cq2.setTitle("Edit", for: .normal)
            cq3.setTitle("Edit", for: .normal)
            cq4.setTitle("Edit", for: .normal)
            cmt.setTitle("Edit", for: .normal)
            cfl.setTitle("Edit", for: .normal)
            cq1.setTitle("Done", for: .normal)
            currentSelected = 0
            pickerView.selectRow(intFromStr(gq1disp.text!), inComponent: 0, animated: true)
        }
    }
    
    @IBAction func cq2press(_ sender: UIButton) {
        if(currentSelected == -1) {
            cq2.setTitle("Done", for: .normal)
            currentSelected = 1
            pickerView.selectRow(intFromStr(gq2disp.text!), inComponent: 0, animated: false)
            pickerView.isHidden = false
        }
        else if(currentSelected == 1) {
            pickerView.isHidden = true
            currentSelected = -1
            cq2.setTitle("Edit", for: .normal)
        }
        else {
            cq1.setTitle("Edit", for: .normal)
            cq3.setTitle("Edit", for: .normal)
            cq4.setTitle("Edit", for: .normal)
            cmt.setTitle("Edit", for: .normal)
            cfl.setTitle("Edit", for: .normal)
            cq2.setTitle("Done", for: .normal)
            currentSelected = 1
            pickerView.selectRow(intFromStr(gq2disp.text!), inComponent: 0, animated: true)
        }
    }
    
    @IBAction func cq3press(_ sender: UIButton) {
        if(currentSelected == -1) {
            cq3.setTitle("Done", for: .normal)
            currentSelected = 2
            pickerView.selectRow(intFromStr(gq3disp.text!), inComponent: 0, animated: false)
            pickerView.isHidden = false
        }
        else if(currentSelected == 2) {
            pickerView.isHidden = true
            currentSelected = -1
            cq3.setTitle("Edit", for: .normal)
        }
        else {
            cq1.setTitle("Edit", for: .normal)
            cq2.setTitle("Edit", for: .normal)
            cq4.setTitle("Edit", for: .normal)
            cmt.setTitle("Edit", for: .normal)
            cfl.setTitle("Edit", for: .normal)
            cq3.setTitle("Done", for: .normal)
            currentSelected = 2
            pickerView.selectRow(intFromStr(gq3disp.text!), inComponent: 0, animated: true)
        }
    }
    
    @IBAction func cq4press(_ sender: UIButton) {
        if(currentSelected == -1) {
            cq4.setTitle("Done", for: .normal)
            currentSelected = 3
            pickerView.selectRow(intFromStr(gq4disp.text!), inComponent: 0, animated: false)
            pickerView.isHidden = false
        }
        else if(currentSelected == 3) {
            pickerView.isHidden = true
            currentSelected = -1
            cq4.setTitle("Edit", for: .normal)
        }
        else {
            cq1.setTitle("Edit", for: .normal)
            cq2.setTitle("Edit", for: .normal)
            cq3.setTitle("Edit", for: .normal)
            cmt.setTitle("Edit", for: .normal)
            cfl.setTitle("Edit", for: .normal)
            cq4.setTitle("Done", for: .normal)
            currentSelected = 3
            pickerView.selectRow(intFromStr(gq4disp.text!), inComponent: 0, animated: true)
        }
    }
    
    @IBAction func cmtpress(_ sender: UIButton) {
        if(currentSelected == -1) {
            cmt.setTitle("Done", for: .normal)
            currentSelected = 4
            pickerView.selectRow(intFromStr(gmtdisp.text!), inComponent: 0, animated: false)
            pickerView.isHidden = false
        }
        else if(currentSelected == 4) {
            pickerView.isHidden = true
            currentSelected = -1
            cmt.setTitle("Edit", for: .normal)
        }
        else {
            cq1.setTitle("Edit", for: .normal)
            cq2.setTitle("Edit", for: .normal)
            cq3.setTitle("Edit", for: .normal)
            cq4.setTitle("Edit", for: .normal)
            cfl.setTitle("Edit", for: .normal)
            cmt.setTitle("Done", for: .normal)
            currentSelected = 4
            pickerView.selectRow(intFromStr(gmtdisp.text!), inComponent: 0, animated: true)
        }
    }
    
    @IBAction func cflpress(_ sender: UIButton) {
        if(currentSelected == -1) {
            cfl.setTitle("Done", for: .normal)
            currentSelected = 5
            pickerView.selectRow(intFromStr(gfldisp.text!), inComponent: 0, animated: false)
            pickerView.isHidden = false
        }
        else if(currentSelected == 5) {
            pickerView.isHidden = true
            currentSelected = -1
            cfl.setTitle("Edit", for: .normal)
        }
        else {
            cq1.setTitle("Edit", for: .normal)
            cq2.setTitle("Edit", for: .normal)
            cq3.setTitle("Edit", for: .normal)
            cq4.setTitle("Edit", for: .normal)
            cmt.setTitle("Edit", for: .normal)
            cfl.setTitle("Done", for: .normal)
            currentSelected = 5
            pickerView.selectRow(intFromStr(gfldisp.text!), inComponent: 0, animated: true)
        }
    }
    
    func updateGradeDisp() {
        print("called")
        if q1used && q2used && q3used && q4used && mtused && flused {
            let qsum = getNumVal(gq1disp) + getNumVal(gq2disp) + getNumVal(gq3disp) + getNumVal(gq4disp)
            let grade = 0.2 * qsum + 0.08 * getNumVal(gmtdisp) + 0.12 * getNumVal(gfldisp)
            print(grade)
            GCOutput.text = "Your grade is " + getGradeVal(grade) + "."
        }
        else {
            GCOutput.text = ""
        }
    }
    
    func getNumVal(_ label: UILabel) -> Double {
        if(label.text == "A+") { return 8 }
        if(label.text == "A") { return 7 }
        if(label.text == "B+") { return 6 }
        if(label.text == "B") { return 5 }
        if(label.text == "C+") { return 4 }
        if(label.text == "C") { return 3 }
        if(label.text == "D") { return 2 }
        return 0
    }
    
    func getGradeVal(_ grade: Double) -> String {
        if(grade >= 7.5) { return "an A+" }
        if(grade >= 6.5) { return "an A" }
        if(grade >= 5.5) { return "a B+" }
        if(grade >= 4.5) { return "a B" }
        if(grade >= 3.5) { return "a C+" }
        if(grade >= 2.5) { return "a C" }
        if(grade >= 1.5) { return "a D" }
        return "an F"
    }
    
    func intFromStr(_ str: String) -> Int {
        if(str == "") {
            return 0
        }
        var i = 1
        while(grades[i] != str && i < 9) {
            i = i + 1
        }
        return i;
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currentSelected = -1
        pickerView.isHidden = true
        GCOutput.text = ""
        gq1disp.text = ""
        gq2disp.text = ""
        gq3disp.text = ""
        gq4disp.text = ""
        gmtdisp.text = ""
        gfldisp.text = ""
        
        cq1.setTitle("Edit", for: .normal)
        cq2.setTitle("Edit", for: .normal)
        cq3.setTitle("Edit", for: .normal)
        cq4.setTitle("Edit", for: .normal)
        cmt.setTitle("Edit", for: .normal)
        cfl.setTitle("Edit", for: .normal)
        
        q1used = false
        q2used = false
        q3used = false
        q4used = false
        mtused = false
        flused = false
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
