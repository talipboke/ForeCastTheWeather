//
//  CustomImageView.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit


public class CustomImageView: UIImageView {
    //    private var BorderWidth
    override public func layoutSubviews() {
        super.layoutSubviews()
        setDesignables(radiusRate: RadiusRate, borderRate: BorderRate, borderColor: BorderColor)
    }
    @IBInspectable var RadiusRate:Int = 0{
        didSet {
        }
    }
    @IBInspectable var BorderRate:Int = 0 {
        didSet {
        }
    }
    @IBInspectable var BorderColor:UIColor? {
        didSet {
        }
    }
    
    
}
