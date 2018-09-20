//
//  HomeVC.swift
//  ForeCastTheWeather
//
//  Created by Talip on 14.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit


//class HomeVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

class HomeVC: BaseListVC<HomeView>,UISearchBarDelegate{
    
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
            self.castedView.table.reloadData()
        }
    }
    func searchOnService(cityName:String){
        viewModel.getWheatherForcast(cityName: cityName) { (allResponse) in
            self.navigateToTimeIntervalsPage(allResponse: allResponse)
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
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
