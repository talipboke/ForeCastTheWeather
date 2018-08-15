//
//  DetailVC.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class DetailVC: BaseVC {
    var list:List?
    
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var pressureLbl: UILabel!
    @IBOutlet weak var seeRateLbl: UILabel!
    @IBOutlet weak var hummadityLbl: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        // Do any additional setup after loading the view.
    }
    private func setData(){
        self.navigationItem.title = list?.dateAndHour
        temperatureLbl.text = list!.main!.fullTemp!
        pressureLbl.text = String(describing:list!.main!.pressure!)
        seeRateLbl.text = String(describing:list!.main!.sea_level!)
        hummadityLbl.text = String(describing:list!.main!.humidity!)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
