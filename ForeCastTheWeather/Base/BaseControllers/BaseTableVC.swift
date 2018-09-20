//
//  BaseTableVC.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class BaseListVC<V:BaseListView>: BaseVC<V>,UITableViewDelegate,UITableViewDataSource {
    
    var viewModel:TableVM!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        delegateTable()
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.castedView.table.tableFooterView = UIView()
    }
    func delegateTable(){
        castedView.table.delegate = self
        castedView.table.dataSource = self
    }
    func setTableViewProperties(){
        self.castedView.table.tableFooterView = UIView()
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return viewModel.setUpTableCell(table: castedView.table, indexPath: indexPath)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection(section: section)
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.numberOfSections()
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
}
