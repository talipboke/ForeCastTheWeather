//
//  HomeVM.swift
//  ForeCastTheWeather
//
//  Created by Talip Böke on 20.09.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class HomeVM: BaseTableVM {
    let APP_ID = "8827fbf408dc7e1418f3c1e84596334c"
    let METRIC = "metric"
    
    func readCitiesFromLocalDB(callBack: @escaping()->()){
        LocalDataManager.readItems { (cityList) in
            self.fillDataList(list: cityList)
            callBack()
        }
    }
    func getCurrentCityFromLocationManager(indexPathRow:Int)->String{
        return LocalDataManager.cities[indexPathRow].name!
    }
    func getWheatherForecast(cityName: String,success: @escaping (_ response: AllResponse) -> ()){
        let searchPostDTO = SearchPostDTO()
        searchPostDTO.q = cityName //bu search datasından gelicek.
        searchPostDTO.appid = APP_ID
        searchPostDTO.units = METRIC
        
        var prm = [String:String]()
        do{
            prm = try JSONDecoder().decode([String: String].self, from: JSONEncoder().encode(searchPostDTO))
            
        }
        catch{
            print(error)
        }
        
        ServiceManager.doRequest(url:ServiceProperties.FORECAST,prm: prm, success: { (_ allResponse : AllResponse) in
            success(allResponse)
        }) { (error) in
            print(error)
        }
    }
}
