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
    
    func requestWithUrl(type: String?, urlHeader: URL?, parameters: NSDictionary?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request: URLRequest?
        if type == "POST" {
            request = convertUrlToPOSTRequest(urlHeader: urlHeader, parameters: parameters)
        } else if type == "GET" {
            
        }
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: sessionConfig)
        let dataTask: URLSessionDataTask = session.dataTask(with: request!, completionHandler: completion)
        dataTask.resume()
    }
    
    func convertUrlParametersToPOSTUrl(parameters: NSDictionary?) -> String {
        let paramList = NSMutableArray()
        for subDict in parameters! {
            let tmpString = "\(subDict.0)=\(subDict.1)"
            paramList.add(tmpString)
        }
        let paramString = paramList.componentsJoined(by: "&")
        return paramString
    }
    
    func convertUrlParametersToGETUrl(parameters: NSArray?) -> String {
        let parameList = NSMutableArray()
        for subString in parameters! {
            parameList.add(subString)
        }
        let paramString = parameList.componentsJoined(by: "/")
        return paramString
    }
    
    func convertUrlToPOSTRequest(urlHeader: URL?, parameters: NSDictionary?) -> URLRequest {
        var request = URLRequest(url: urlHeader!)
        if (parameters != nil) && (parameters?.count)! > 0 {
            request.httpMethod = "POST"
            let paramString = convertUrlParametersToPOSTUrl(parameters: parameters!)
            let paramData = paramString.data(using: String.Encoding.utf8)
            request.httpBody = paramData
        } else {
            request.httpMethod = "GET"
        }
        return request
    }
    
    func convertUrlToGETRequset(url: URL?) -> URLRequest {
        var request = URLRequest(url: url!)
        request.httpMethod = "GET"
        return request;
    }
    
}
