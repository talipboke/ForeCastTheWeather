//
//  StoryBoardExtensions.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import UIKit


extension UIStoryboard {
    enum Storyboard: String {
        
        case main
        
        var filename: String {
            return rawValue.capitalized
        }
    }
    class func storyboard(storyboard: Storyboard, bundle: Bundle? = nil) -> UIStoryboard {
        return UIStoryboard(name: storyboard.filename, bundle: bundle)
    }
    func instantiateVC<T: UIViewController>() -> T {
        let className = String(describing: T.self)
        return self.instantiateViewController(withIdentifier: className) as! T
    }
}

