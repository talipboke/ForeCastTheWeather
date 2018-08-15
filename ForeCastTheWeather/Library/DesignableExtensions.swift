//
//  DesignableExtensions.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit

extension UIView{
    func setDesignables(radiusRate:Int,borderRate:Int,borderColor:UIColor?){
        //ileride tüm özellikleri bu fonksiyonun içerisine yazabiliriz.
        setClipsAndMasksToBounds()
        setRadiusRate(radiusRate: radiusRate)
        setBorderRate(borderRate: borderRate)
        setBorderColor(borderColor: borderColor)
    }
    private func setClipsAndMasksToBounds(){
        self.clipsToBounds = true
        self.layer.masksToBounds = true
    }
    private func setRadiusRate(radiusRate:Int){
        self.layer.cornerRadius = (self.frame.height * CGFloat(radiusRate)) / 100
    }
    private func setBorderRate(borderRate:Int){
        self.layer.borderWidth = (self.frame.height * CGFloat(borderRate)) / 100
    }
    private func setBorderColor(borderColor:UIColor?){
        self.layer.borderColor = borderColor?.cgColor
    }
    
}
