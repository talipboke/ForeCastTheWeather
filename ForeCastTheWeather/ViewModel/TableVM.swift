//
//  TableVM.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class TableVM: NSObject {
    
    var dataList = [Codable]()
    var callBack : (()->())!
    var cellIdentifier:String!
    
    init(cellIdentifier:String){
        super.init()
        self.cellIdentifier = cellIdentifier
    }
    init(cellIdentifier: String,callBack: @escaping ()->()) {
        super.init()
        self.cellIdentifier = cellIdentifier
        self.callBack = callBack
    }
    func cleearDataList(){
        self.dataList.removeAll()
    }
    func fillDataList(list:[Codable]){
        self.cleearDataList()
        self.dataList = list
    }
    
    func getWheatherForcast(prm:[String:Any],success: @escaping (_ response: AllResponse) -> ()){
        
        ServiceManager.doRequest(url:ServiceProperties.FORECAST,prm: prm, success: { (_ allResponse : AllResponse) in
            success(allResponse)
        }) { (error) in
            print(error)
        }
    }
    func readCitiesFromLocalDB(callBack: @escaping()->()){
        LocalDataManager.readItems { (cityList) in
            self.fillDataList(list: cityList)
            callBack()
        }
    }
    func saveCityToLocalDb(cityName:String){
        LocalDataManager.saveCityToDatabase(cityName: cityName)
    }
    func getCurrentCityFromLocationManager(indexPathRow:Int)->String{
        return LocalDataManager.cities[indexPathRow].name!
    }
    func numberOfSections()->Int{
        return 1
    }
    func numberOfRowsInSection(section:Int)->Int{
        return dataList.count
    }
    func setUpTableCell(table:BaseTableView,indexPath : IndexPath)->BaseCell {
        let cell = table.dequeue(identifier: cellIdentifier)
        if self.dataList.count > 0 {
            let item = dataList[indexPath.row]
            cell.fillData(ent: item)
            return cell
        }
        else
        {
            return cell
        }
    }
}

