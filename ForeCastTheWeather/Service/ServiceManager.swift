//
//  ServiceManager.swift
//  ForeCastTheWeather
//
//  Created by Talip on 14.08.2018.
//  Copyright © 2018 TalipBOKE. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

class ServiceManager{
    
    class func doRequest<T:Codable>(url:String? = ServiceProperties.URL,method:HTTPMethod? = .get,prm:[String:Any],success: @escaping (_ response: T) -> (),failure:@escaping(String)->()){
        SVProgressHUD.show()
        Alamofire.request(url!, method: method!, parameters: prm, encoding: URLEncoding.default, headers: nil).responseData { (response) in
            if let data = response.result.value{
                do {
                    let jsonResults = try JSONDecoder().decode(T.self, from: response.data!)
                    SVProgressHUD.dismiss()
                    success(jsonResults)
                } catch {
                    SVProgressHUD.dismiss()
                    failure("Parse Hatası servis başlıklarını kontrol et.")
                    print(error)
                }
            }
            else{
                SVProgressHUD.dismiss()
                failure("Alamofire cevap dönmüyor.")
            }
        }
    }
    class func setHudSettings(){
        SVProgressHUD.setForegroundColor(UIColor.red)
        SVProgressHUD.setBackgroundLayerColor(UIColor.white)
        SVProgressHUD.setDefaultMaskType(.black)
    }
    
}

