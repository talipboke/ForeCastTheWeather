//
//  TimeIntervalsCell.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class TimeIntervalsCell: BaseCell{

    @IBOutlet weak var dateLbl: UILabel!
    
    var listEnt:List!
    
    //var timeIntervalEnt:
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func fillData(ent: Codable, info: Any?) {
        listEnt = ent as! List
        dateLbl.text = listEnt.dateAndHour
        //veriyi buraya render edicez
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
