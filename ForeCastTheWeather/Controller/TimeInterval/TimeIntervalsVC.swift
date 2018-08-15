//
//  TimeIntervalsVC.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class TimeIntervalsVC: BaseListVC {

    
    var navItemTitle:String?
    var listArray:[List]?

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TableVM(cellIdentifier: TimeIntervalsCell.className)
        setViewProperties()
        
        self.viewModel.fillDataList(list:listArray!)
        self.table.reloadData()
        
    }
    func setViewProperties(){
        if let cityName = navItemTitle{
            viewModel.saveCityToLocalDb(cityName: cityName)
            self.navigationItem.title = cityName
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc:DetailVC = UIStoryboard.storyboard(storyboard: .main).instantiateVC()
        vc.list = self.listArray?[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}
