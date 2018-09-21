//
//  BaseSearchListVC.swift
//  ForeCastTheWeather
//
//  Created by Talip Böke on 21.09.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class BaseSearchListVC<V:BaseSearchListView,VM:BaseTableVM> : BaseListVC<V,VM>,UISearchBarDelegate{
    override func viewDidLoad() {
        super.viewDidLoad()
        setSearchBarSettings()
    }
    func setSearchBarSettings(){
        castedView.searchBar.delegate = self
        castedView.searchBar.becomeFirstResponder()
        castedView.searchBar.returnKeyType = UIReturnKeyType.done
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
    }
}
