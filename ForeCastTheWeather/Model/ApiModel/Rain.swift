//
//  Rain.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import Foundation

class Rain:Codable{
    var threeH:Double?
    
    enum CodingKeys: String, CodingKey {
        case threeH = "3h"
    }
}
