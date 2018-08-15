//
//  StringExtensions.swift
//  ForeCastTheWeather
//
//  Created by Talip on 15.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import Foundation

extension String{
    func jsonStringToObject<T>(type: T.Type) -> T? {
        if let data = self.data(using: .utf8) {
            do {
                return try JSONSerialization.jsonObject(with: data, options: []) as? T
            } catch {
                print(error.localizedDescription)
            }
        }
        return nil
    }
}

