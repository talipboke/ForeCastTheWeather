//
//  TimeIntervalsVM.swift
//  ForeCastTheWeather
//
//  Created by Talip Böke on 20.09.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import Foundation

class TimeIntervalsVM : BaseTableVM {
    func saveCityToLocalDb(cityName:String){
        LocalDataManager.saveCityToDatabase(cityName: cityName)
    }
}
