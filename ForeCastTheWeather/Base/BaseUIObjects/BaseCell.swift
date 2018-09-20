//
//  BaseCell.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

public class BaseCell: UITableViewCell {
    
    
    override public func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    func fillData(ent : Codable,info: Any? = nil){
        
    }
    override public func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
