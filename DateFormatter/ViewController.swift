//
//  ViewController.swift
//  DateFormatter
//
//  Created by Ashwani Sharma on 30/04/16.
//  Copyright © 2016 Ashwani Sharma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let dateString1 = ASDateFormatter.convertStringToDateWithDate("30/04/1990", format: "dd/MM/yy")
        print("\(dateString1)");
        
//        dateString1 = ASDateFormatter.convertStringToDateFromAvailableFormates("30/04/1990 06:30 PM", format: ASDateFormatter.ASDateFormats.FORMAT2)
//        print("\(dateString1)");
        
        let dateString2 = ASDateFormatter.convertStringToDateWithDate("02/05/2016 16:03",format: "dd/MM/yy HH:mm")
        print("\(dateString2)");
        
        
        let result = ASDateFormatter.compareDates(dateString1, secondDate: dateString2)
        
        
        print("\(result)")
        
        
        let relativeTime = ASDateFormatter.timeAgoSince(dateString2)
        
        
        print("\(relativeTime)")
        
        
//        dateString2 = ASDateFormatter.convertDateToStringFromAvailableFormates(NSDate(), format: ASDateFormatter.ASDateFormats.FORMAT5)
//        print("\(dateString2)");
        /*
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        formatter.dateFormat = "dd/MM/yy"
        
        let dateString = formatter.stringFromDate(NSDate())
        
        print("\(dateString)");
        
        
        var dateString1 = ASDateFormatter.convertDateToStringWithDate(NSDate(),format: "dd/MM/yy hh:mm")
        print("\(dateString1)");
        
        dateString1 = ASDateFormatter.convertDateToStringFromAvailableFormates(NSDate(), format: ASDateFormatter.ASDateFormats.FORMAT1)
        
        print("DateFormat - 1 => \(dateString1)");
        
        dateString1 = ASDateFormatter.convertDateToStringFromAvailableFormates(NSDate(), format: ASDateFormatter.ASDateFormats.FORMAT2)
        
        print("DateFormat - 2 => \(dateString1)");
        
        dateString1 = ASDateFormatter.convertDateToStringFromAvailableFormates(NSDate(), format: ASDateFormatter.ASDateFormats.FORMAT3)
        
        print("DateFormat - 3 => \(dateString1)");
        
        dateString1 = ASDateFormatter.convertDateToStringFromAvailableFormates(NSDate(), format: ASDateFormatter.ASDateFormats.FORMAT4)
        
        print("DateFormat - 4 => \(dateString1)");
        
        dateString1 = ASDateFormatter.convertDateToStringFromAvailableFormates(NSDate(), format: ASDateFormatter.ASDateFormats.FORMAT5)
        
        print("DateFormat - 5 => \(dateString1)");
 
 */
    }

}

