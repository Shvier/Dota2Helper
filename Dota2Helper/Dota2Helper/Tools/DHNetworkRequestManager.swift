//
//  DHNetworkRequestManager.swift
//  Dota2Helper
//
//  Created by Shvier on 9/19/16.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit

enum RequestType {
    case POST
    case GET
    case DEFAULT
}

class DHNetworkRequestManager: NSObject {

    static let sharedInstance = DHNetworkRequestManager()
    
    func requestWithUrl(type: RequestType, urlHeader: URL?, parameters: Any?, completion: @escaping (Data?, URLResponse?, Error?) -> Swift.Void) {
        let request: URLRequest?
        switch type {
        case .POST:
            request = convertUrlToPOSTRequest(urlHeader: urlHeader, parameters: parameters as! NSDictionary?)
            break;
        case .GET:
            request = convertUrlToGETRequset(urlHeader: urlHeader, parameters: parameters as! NSDictionary?)
            break;
        default:
            request = convertUrlToDEFAULTRequset(urlHeader: urlHeader, parameters: parameters as! NSArray?)
            break;
        }
        let sessionConfig: URLSessionConfiguration = URLSessionConfiguration.default
        let session: URLSession = URLSession(configuration: sessionConfig)
        let dataTask: URLSessionDataTask = session.dataTask(with: request!, completionHandler: completion)
        dataTask.resume()
    }
    
    func convertUrlParametersToPOSTUrl(parameters: NSDictionary?) -> String {
        if parameters != nil {
            let paramList = NSMutableArray()
            for subDict in parameters! {
                let tmpString = "\(subDict.0)=\(subDict.1)"
                paramList.add(tmpString)
            }
            let paramString = paramList.componentsJoined(by: "&")
            return paramString
        } else {
            return ""
        }
    }
    
    func convertUrlParametersToGETUrl(parameters: NSDictionary?) -> String {
        if parameters != nil {
            let paramList = NSMutableArray()
            for subDict in parameters! {
                let tmpString = "\(subDict.0)=\(subDict.1)"
                paramList.add(tmpString)
            }
            let paramString = paramList.componentsJoined(by: "&")
            return paramString
        } else {
            return ""
        }
    }
    
    func convertUrlParametersToDEFAULTUrl(parameters: NSArray?) -> String {
        if parameters != nil {
            let paramList = NSMutableArray()
            for subString in parameters! {
                paramList.add(subString as! String)
            }
            let paramString = paramList.componentsJoined(by: "/")
            return paramString
        } else {
            return ""
        }
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
    
    func convertUrlToGETRequset(urlHeader: URL?, parameters: NSDictionary?) -> URLRequest {
        let paramString = convertUrlParametersToGETUrl(parameters: parameters)
        let urlString: String = urlHeader!.absoluteString + "?" + paramString
        let url: URL = URL(string: urlString)!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        return request;
    }
    
    func convertUrlToDEFAULTRequset(urlHeader: URL?, parameters: NSArray?) -> URLRequest {
        let paramString = convertUrlParametersToDEFAULTUrl(parameters: parameters)
        let urlString: String = urlHeader!.absoluteString + paramString
        let url: URL = URL(string: urlString)!
        var request: URLRequest = URLRequest(url: url)
        request.httpMethod = "GET"
        return request;
    }
    
}
