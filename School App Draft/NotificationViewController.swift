//
//  ViewController.swift
//  School App Draft
//
//  Created by Ryan Lefkowitz on 6/11/17.
//  Copyright © 2017 RyanCannotDevelop. All rights reserved.
//

import UIKit
import UserNotifications

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var todayLabel: UILabel!
    
    @IBOutlet weak var tmrwLabel: UILabel!
    
    @IBOutlet weak var enableNotifications: UISwitch!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @objc var isGrantedNotificationAccess:Bool = false
    
    // Date Array
    let dates: [Int] = [
        0, 0, 1, 2, 1, 2, 0, //September 1-7
        0, 1, 2, 1, 2, 1, 0, //September 8-14
        0, 2, 1, 2, 1, 2, 0, //September 15-21
        0, 1, 2, 1, 2, 1, 0, //September 22-28
        0, 0, 0, 2, 1, 2, 0, //September 29 - October 5
        0, 1, 2, 0, 1, 2, 0, //October 6-12
        0, 0, 1, 2, 1, 2, 0, //October 13-19
        0, 1, 2, 1, 2, 1, 0, //October 20-26
        0, 2, 1, 2, 1, 2, 0, //October 27 - November 2
        0, 1, 2, 1, 2, 1, 0, //November 3-Novmeber 9
        0, 0, 2, 1, 2, 1, 0, //November 10-16
        0, 2, 1, 2, 1, 2, 0, //November 17-23
        0, 1, 2, 0, 0, 0, 0, //November 24-30
        0, 1, 2, 1, 2, 1, 0, //December 1-7
        0, 2, 1, 2, 1, 2, 0, //December 8-14
        0, 1, 2, 1, 2, 1, 0, //December 15-21
        0, 0, 0, 0, 0, 0, 0, //December 22-28
        0, 0, 0, 0, 2, 1, 0, //December 29 - January 4
        0, 2, 1, 2, 1, 2, 0, //January 5-11
        0, 1, 2, 1, 2, 1, 0, //January 12-18
        0, 0, 2, 1, 2, 1, 0, //January 19-25
        0, 2, 1, 2, 1, 2, 0, //January 26 - February 1
        0, 1, 2, 1, 2, 1, 0, //February 2-8
        0, 2, 1, 2, 1, 2, 0, //February 9-15
        0, 0, 0, 0, 0, 0, 0, //February 16-22
        0, 1, 2, 1, 2, 1, 0, //February 23-29
        0, 2, 1, 2, 1, 2, 0, //March 1-7
        0, 1, 2, 1, 2, 1, 0, //March 8-14
        0, 2, 1, 2, 1, 2, 0, //March 15-21
        0, 1, 2, 1, 2, 1, 0, //March 22-28
        0, 2, 1, 2, 1, 2, 0, //March 29 - April 4
        0, 1, 2, 1, 0, 0, 0, //April 5-11
        0, 0, 0, 0, 0, 0, 0, //April 12-18
        0, 2, 1, 2, 1, 2, 0, //April 19-25
        0, 1, 2, 1, 2, 1, 0, //April 26 - May 2
        0, 2, 1, 2, 1, 2, 0, //May 3 - May 9
        0, 1, 2, 1, 2, 1, 0, //May 10-16
        0, 2, 1, 2, 1, 2, 0, //May 17-23 * Might need to change *
        0, 0, 1, 2, 1, 2, 0, //May 24-30
        0, 1, 2, 1, 2, 1, 0, //May 31 - June 6
        0, 2, 1, 2, 1, 2, 0, //June 7-13
        0, 1, 2, 1, 2, 1, 0, //June 14-20
        0, 2, 1, 2, 1, 2, 0, //June 21-27
    ]
    
    // detects and reacts to switch state changes
    @IBAction func switchChange(_ sender: Any) {
        if(enableNotifications.isOn) {
//            setUpNotification()
        }
        else {
//            UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification1"])
        }
        
        UserDefaults.standard.set(enableNotifications.isOn, forKey: "switchWasOn")
    }
    
    // detects and reacts to date picker switch changes
    @IBAction func noficationTimeChange(_ sender: Any) {
        if(enableNotifications.isOn) {
//            setUpNotification()
        }
        
        UserDefaults.standard.set(datePicker.date, forKey: "lastDate")
    }
    
    // returns string for notification given the day type id
    @objc func dayStr(dayID: Int) -> String {
        
        // converts id into string
        var tempStr = "There is no school today"
        
        if dayID == -1 {
            tempStr = "Error, Sorry for the inconvience"
        }
        
        if dayID == 0 {
            tempStr = "There is no school today"
        }
        
        if dayID == 1 {
            tempStr = "Today is a Red Day"
        }
            
        else if dayID == 2 {
            tempStr = "Today is a White Day"
        }
            
        else if dayID == 3 {
            tempStr = "School is cancelled today"
        }
            
        else if dayID == 4 {
            tempStr = "Today is a Red Day, with a 2 hour delay"
        }
            
        else if dayID == 5 {
            tempStr = "Today is a White Day, with a 2 hour delay"
        }
            
        else if dayID == 6 {
            tempStr = "Today is finals week"
        }
            
        else if dayID == 7 {
            tempStr = "Today is a midterm day"
        }
        
        return tempStr
    }
    
    @objc func getTodayIndex() -> Int {
        // retrieves string from day_color page on shs website
        //        var htmlStr = "";
        //        let urlString = "https://syosseths.com/day"
        //        guard let url = URL(string: urlString) else {
        //            print("Error: \(urlString) doesn't seem to be a valid URL")
        //            return 0
        //        }
        //
        //        do {
        //            htmlStr = try String(contentsOf: url, encoding: .ascii)
        //        } catch let error {
        //            print("Error: \(error)")
        //        }
        //
        //        // cuts out surrounding text
        //        let dayStr = htmlStr.replace(target: "{\"data\":{\"id\":\"current_day_color\",\"type\":\"days\",\"attributes\":{\"color\":\"", withString: "").replace(target: "\"},\"relationships\":{\"closure\":{\"data\":null}}},\"jsonapi\":{\"version\":\"1.0\"}}", withString: "")
        
        // setting the original date
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy/MM/dd"
        let origDate = formatter.date(from: "2019/09/03") //must change this
       
        // Calculating the amount of days since the original date
        let diffInDays = Calendar.current.dateComponents([.day], from: origDate!, to: Date()).day
        
        return diffInDays!
    }
    
    // returns the day type (R/W/etc)
    @objc func getDayType(dayIndex: Int) -> Int {
        
        if(dayIndex >= dates.count) {return -1}
        
        // Fetches integer value of current day from array
        let dayValue = dates[dayIndex]
        
        // returns id
        return dayValue
    }
    
    // viewDidLoad
    // displays next day
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        let today = getTodayIndex()
        let todayType = getDayType(dayIndex: today)
        todayLabel.text = dayStr(dayID: todayType)
        todayLabel.textColor = dayColor(dayID: todayType)
        
        let tmrw = getTodayIndex() + 1
        let tmrwType = getDayType(dayIndex: tmrw)
        tmrwLabel.text = dayStr(dayID: tmrwType).replace(target: "Today", withString: "Tomorrow").replace(target: "today", withString: "tomorrow")
        tmrwLabel.textColor = dayColor(dayID: tmrwType)
        
        UNUserNotificationCenter.current().removePendingNotificationRequests(withIdentifiers: ["notification1"])
        
//        initNotificationSetupCheck()
            
//        if(enableNotifications.isOn) {
//            setUpNotification()
//        }
    }
    
    @objc func userAlreadyExist(key: String) -> Bool {
        return UserDefaults.standard.object(forKey: key) != nil
    }
    
    @objc func initNotificationSetupCheck() {
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert])
        { (success, error) in
            if success {
                print("Permission Granted")
            } else {
                print("There was a problem!")
            }
        }
    }
    
    // returns color corresponding to day type id
    @objc func dayColor(dayID: Int) -> UIColor {
        
        // day mod 3
        let dayMod = dayID % 3
        
        var color = UIColor.black // id #0 = black
        
        if dayMod == 2 || dayID > 5 {
            color = UIColor.black // id #2 = black
        }
        else if dayMod == 1 || dayID > 5 {
            color = UIColor.red // id #1 = red
        }
        
        // returns color
        return color
        
    }
    
    @objc func setUpNotification() {
        
        let dayID = getDayType(dayIndex: getTodayIndex())
        let notification = UNMutableNotificationContent()
        notification.title = "Syosset HS"
        notification.body = dayStr(dayID: dayID)
        
        let triggerDaily = Calendar.current.dateComponents([.hour,.minute], from: datePicker.date)
        let trigger = UNCalendarNotificationTrigger(dateMatching: triggerDaily, repeats: true)
        let request = UNNotificationRequest(identifier: "notification1", content: notification, trigger: trigger)
        
        UNUserNotificationCenter.current().add(request, withCompletionHandler: nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

extension String
{
    func replace(target: String, withString: String) -> String
    {
        return self.replacingOccurrences(of: target, with: withString, options: NSString.CompareOptions.literal, range: nil)
    }
}
