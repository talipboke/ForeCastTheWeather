//
//  ServiceProperties.swift
//  ForeCastTheWeather
//
//  Created by Talip on 14.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import Foundation

class ServiceProperties{
    public static var URL  :String{
        get{
            return "http://api.openweathermap.org/data/2.5/"
        }
    }
    public static var FORECAST:String{
        get{
            return ServiceProperties.URL + "forecast"
        }
    }
}
