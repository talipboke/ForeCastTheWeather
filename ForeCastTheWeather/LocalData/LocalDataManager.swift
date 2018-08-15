//
//  LocalDataManager.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit
import CoreData

class LocalDataManager{
    
    static var cities = [SearchedCityDTO]() //datayı her okuduktan sonra buraya yazalım bir daha db'den sormayalım.
    private static var context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    class func saveCityToDatabase(cityName : String){
        
        if cities.contains(where: {$0.name == cityName}) {
        
        } else {
            let newCity = NSEntityDescription.insertNewObject(forEntityName: "CityEntity", into: context)
            newCity.setValue(cityName, forKey: "name")
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    class func readItems(callBack: @escaping([SearchedCityDTO])->()) {
        
        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "CityEntity")
        do {
            let resultString = try context.fetch(request)
            if resultString.count > 0 {
                var tempCityArray = [SearchedCityDTO]()
                for online in resultString {
                    let tempCity = SearchedCityDTO()
                    tempCity.name = (online as AnyObject).value(forKey: "name") as! String
                    tempCityArray.append(tempCity)
                }
                LocalDataManager.cities = tempCityArray
                callBack(tempCityArray)
            }
            
        } catch {
            print(error)
        }
    }
}
