//
//  HomeCell.swift
//  ForeCastTheWeather
//
//  Created by Talip on 14.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

class HomeCell: BaseCell {

    @IBOutlet weak var cityNameLbl: UILabel!
    
    var searchedCityEnt:SearchedCityDTO!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    override func fillData(ent: Codable, info: Any?) {
        searchedCityEnt = ent as! SearchedCityDTO
        cityNameLbl.text = searchedCityEnt.name
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
