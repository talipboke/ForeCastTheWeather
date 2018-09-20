//
//  DetailVC.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class DetailVC: BaseVC<DetailView> {
    var list:List?
    
    override func viewDidLoad() {
    
        
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    private func setData(){
        self.navigationItem.title = list?.dateAndHour
        castedView.temperatureLbl.text = list!.main!.fullTemp!
        castedView.pressureLbl.text = String(describing:list!.main!.pressure!)
        castedView.seeRateLbl.text = String(describing:list!.main!.sea_level!)
        castedView.hummadityLbl.text = String(describing:list!.main!.humidity!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
