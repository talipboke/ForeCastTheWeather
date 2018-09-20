//
//  BaseTableView.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

public class BaseTableView: UITableView {
    
    public func dequeue(identifier:String)-> BaseCell {
        return self.dequeueReusableCell(withIdentifier: identifier) as! BaseCell
    }
    
}
