//
//  HomeVC.swift
//  ForeCastTheWeather
//
//  Created by Talip on 14.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit


//class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

class HomeVC: BaseListVC,UISearchBarDelegate{
    
    let APP_ID = "8827fbf408dc7e1418f3c1e84596334c"
    let METRIC = "metric"
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel = TableVM(cellIdentifier: HomeCell.className)
        ServiceManager.setHudSettings()
        setSearchBarSettings()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //burada sürekli core datayı okuyup tableView'ı güncelleyebiliriz.
        viewModel.readCitiesFromLocalDB {
            self.table.reloadData()
        }
    }
    func searchOnService(cityName:String){
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
        viewModel.getWheatherForcast(prm: prm) { (allResponse) in
            self.navigateToTimeIntervalsPage(allResponse: allResponse)
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.searchOnService(cityName: viewModel.getCurrentCityFromLocationManager(indexPathRow: indexPath.row))
    }
    func setSearchBarSettings(){
        searchBar.delegate = self
        searchBar.becomeFirstResponder()
        searchBar.returnKeyType = UIReturnKeyType.done
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchBarText = searchBar.text
        
        if searchBarText != nil && searchBarText != ""{
            self.searchOnService(cityName: searchBarText!)
        }
    }
    func navigateToTimeIntervalsPage(allResponse:AllResponse){
        let vc:TimeIntervalsVC = UIStoryboard.storyboard(storyboard: .main).instantiateVC()
        vc.navItemTitle = allResponse.city?.name
        vc.listArray = allResponse.list
        self.navigationController?.pushViewController(vc, animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
