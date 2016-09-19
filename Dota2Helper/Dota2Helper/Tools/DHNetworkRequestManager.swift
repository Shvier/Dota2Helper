//
//  DHNetworkRequestManager.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

class DHNetworkRequestManager: NSObject {

    static let sharedInstance = DHNetworkRequestManager()
    
    func requestWithUrl(urlHeader: URL?, parameters: NSDictionary?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        var request = URLRequest(url: urlHeader!)
        if (parameters != nil) && (parameters?.count)! > 0 {
            request.httpMethod = "POST"
            let paramList = NSMutableArray()
            for subDict in parameters! {
                let tmpString = "\(subDict.0)=\(subDict.1)"
                paramList.add(tmpString)
            }
            let paramString = paramList.componentsJoined(by: "&")
            let paramData = paramString.data(using: String.Encoding.utf8)
            request.httpBody = paramData
        } else {
            request.httpMethod = "GET"
        }
        
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: sessionConfig)
        let dataTask: URLSessionDataTask = session.dataTask(with: request, completionHandler: completion)
        dataTask.resume()
    }
    
}
