//
//  AppCommon.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//
import UIKit
import Foundation

class AppCommon{
    class func getDaysAndHours(dt_text :String)-> String{
        let calendar = Calendar.current
        let calendarComponents : Set<Calendar.Component> = [.hour, .minute, .second, .day, .month, .year]
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let tempDate : Date = dateFormatter.date(from: dt_text)!
        
        let dateComponent =  calendar.dateComponents(calendarComponents, from: tempDate)
        
        let date = "\(dateComponent.day!)/\(dateComponent.month!)/\(dateComponent.year!)"
        let hour = "\(dateComponent.hour!):\(dateComponent.minute!)\(dateComponent.second!)"
        
        return date + " " + hour
    }

}
