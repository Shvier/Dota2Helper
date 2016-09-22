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
        let request: URLRequest = convertUrlToRequest(urlHeader: urlHeader, parameters: parameters)
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: sessionConfig)
        let dataTask: URLSessionDataTask = session.dataTask(with: request, completionHandler: completion)
        dataTask.resume()
    }
    
    func convertUrlParametersToPostUrl(parameters: NSDictionary?) -> String {
        let paramList = NSMutableArray()
        for subDict in parameters! {
            let tmpString = "\(subDict.0)=\(subDict.1)"
            paramList.add(tmpString)
        }
        let paramString = paramList.componentsJoined(by: "&")
        return paramString
    }
    
    func convertUrlToRequest(urlHeader: URL?, parameters: NSDictionary?) -> URLRequest {
        var request = URLRequest(url: urlHeader!)
        if (parameters != nil) && (parameters?.count)! > 0 {
            request.httpMethod = "POST"
            let paramString = convertUrlParametersToPostUrl(parameters: parameters!)
            let paramData = paramString.data(using: String.Encoding.utf8)
            request.httpBody = paramData
        } else {
            request.httpMethod = "GET"
        }
        return request
    }
    
}
