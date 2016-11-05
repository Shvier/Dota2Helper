//
//  DHBaseNetworkRequest.swift
//  Dota2Helper
//
//  Created by Shvier on 04/11/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import Alamofire

class DHBaseNetworkRequest {
    
    class func request(url: String, parameters: Parameters? = nil, success: @escaping (_ response: Any) -> Void, failure: @autoclosure @escaping () -> Void) {
        Alamofire.request(url, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).responseJSON { (dataResponse) in
            guard let data = dataResponse.data else {
                failure()
                DispatchQueue.main.async {
                    DHProgressHUD.showMessage(message: "网络错误", view: UIApplication.shared.keyWindow!)
                }
                return
            }
            do {
                let result = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.allowFragments) as! NSDictionary
                success(result)
            } catch {
                
            }
        }
    }
    
}
