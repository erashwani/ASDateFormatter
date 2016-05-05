//
//  ASDateFormatter.swift
//  DateFormatter
//
//  Created by Ashwani Sharma on 30/04/16.
//  Copyright © 2016 Ashwani Sharma. All rights reserved.
//

import UIKit

class ASDateFormatter: NSObject {
    
    //MARK: DateComparision Output
    
    enum ASComparisonResult: Int {
        case ASFUTURE = 1
        case ASPAST = -1
        case ASSAME = 0
        case ASERROR = 104
    }
    
    //MARK: DateFormats
    
    enum ASDateFormats {
        case FORMAT1
        case FORMAT2
        case FORMAT3
        case FORMAT4
        case FORMAT5
    }
    
    //MARK: Shared Instanace for Singleton Pattern
    
    class var sharedInstance: ASDateFormatter {
        struct Static {
            static let instance: ASDateFormatter = ASDateFormatter()
        }
        return Static.instance
    }
    
    //MARK: Get Format in User String
    
    private static func getStringFromFormat(format:ASDateFormats!) -> String! {
        
        var dateFromat = String()
        let selectedFormat = format
        
        if let selectedFormat = selectedFormat
        {
            switch (selectedFormat) {
            case .FORMAT1:
                dateFromat = "dd/MM/YYYY"
                break
            case .FORMAT2:
                dateFromat = "dd/MM/YYYY hh:mm a"
                break
            case .FORMAT3:
                dateFromat = "dd/MM/YYYY HH:mm"
                break
            case .FORMAT4:
                dateFromat = "hh:mm a"
                break
            case .FORMAT5:
                dateFromat = "HH:mm"
                break
            }
        }
        
        return dateFromat
    }
    
    //MARK: Convert Date To String With Custom Date Fromat
    
    static func convertDateToStringWithDate(date:NSDate!,format:String!) -> String! {
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        formatter.dateFormat = format
        
        let dateString = formatter.stringFromDate(date)
        
        return dateString
    }
    
    //MARK: Convert Date To String With Predefined Date Fromat
    
    static func convertDateToStringFromAvailableFormates(date:NSDate!,format:ASDateFormats!) -> String! {
        
        
        let dateFromat = self.getStringFromFormat(format)
        
        let formatter = NSDateFormatter()
        formatter.dateStyle = NSDateFormatterStyle.LongStyle
        formatter.timeStyle = .MediumStyle
        formatter.dateFormat = dateFromat
        
        let dateString = formatter.stringFromDate(date)
        
        return dateString
    }
    
    //MARK: Convert String To Date With Custom Date Fromat
    
    static func convertStringToDateWithDate(date:String!,format:String!) -> NSDate! {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        let date = dateFormatter.dateFromString(date)
        
        return date
    }
    
    //MARK: Convert String To Date With Predefined Date Fromat
    
    static func convertStringToDateFromAvailableFormates(date:String!,format:ASDateFormats!) -> NSDate! {
        
        let dateFromat = self.getStringFromFormat(format)
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = dateFromat
        let date = dateFormatter.dateFromString(date)
        
        return date
    }
    
    
    //MARK: Compare two Dates
    
    static func compareDates(firstDate:NSDate,secondDate:NSDate)->ASComparisonResult? //FIXME: Please use same Date Format
    {
        let result : NSComparisonResult = firstDate.compare(secondDate)
        
        switch result {
        case NSComparisonResult.OrderedAscending:
            NSLog("%@ is in future from %@", secondDate, firstDate)
            return ASComparisonResult.ASFUTURE
        case NSComparisonResult.OrderedDescending:
            NSLog("%@ is in past from %@", secondDate, firstDate)
            return ASComparisonResult.ASPAST
        case NSComparisonResult.OrderedSame:
            NSLog("%@ is the same as %@", secondDate, firstDate)
            return ASComparisonResult.ASSAME
        default:
            NSLog("erorr dates %@, %@", secondDate, firstDate)
            return ASComparisonResult.ASERROR
        }
        
    }
    
    
    //MARK: Relative Time Function
    
    static func timeAgoSince(date: NSDate) -> String {
        
        let calendar = NSCalendar.currentCalendar()
        let now = NSDate()
        let unitFlags: NSCalendarUnit = [.Second, .Minute, .Hour, .Day, .WeekOfYear, .Month, .Year]
        let components = calendar.components(unitFlags, fromDate: date, toDate: now, options: [])
        
        if components.year >= 2 {
            return "\(components.year) years ago"
        }
        
        if components.year >= 1 {
            return "Last year"
        }
        
        if components.month >= 2 {
            return "\(components.month) months ago"
        }
        
        if components.month >= 1 {
            return "Last month"
        }
        
        if components.weekOfYear >= 2 {
            return "\(components.weekOfYear) weeks ago"
        }
        
        if components.weekOfYear >= 1 {
            return "Last week"
        }
        
        if components.day >= 2 {
            return "\(components.day) days ago"
        }
        
        if components.day >= 1 {
            return "Yesterday"
        }
        
        if components.hour >= 2 {
            return "\(components.hour) hours ago"
        }
        
        if components.hour >= 1 {
            return "An hour ago"
        }
        
        if components.minute >= 2 {
            return "\(components.minute) minutes ago"
        }
        
        if components.minute >= 1 {
            return "A minute ago"
        }
        
        if components.second >= 3 {
            return "\(components.second) seconds ago"
        }
        
        return "Just now"
        
    }
    
    
}
