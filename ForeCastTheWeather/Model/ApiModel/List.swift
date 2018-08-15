//
//  List.swift
//  ForeCastTheWeather
//
//  Created by Talip on 14.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import Foundation

class List:Codable{

    var dt : Int?
    var main : Main?
    var weather : [Weather]?
    var clouds : Cloud?
    var wind : Wind?
    var rain : Rain?
    
    var sys : Sys!
    var dt_txt : String!
    
    var dateAndHour:String!{
        get{
            return AppCommon.getDaysAndHours(dt_text: dt_txt)
        }
    }
    
}
