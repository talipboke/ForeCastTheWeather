//
//  AllResponse.swift
//  ForeCastTheWeather
//
//  Created by Tal on 14.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import Foundation
import UIKit

class AllResponse:Codable{
    
    var cod : String?
    var message : Double?
    var cnt : Int?
    var list : [List]?
    var city : City?
    
}
