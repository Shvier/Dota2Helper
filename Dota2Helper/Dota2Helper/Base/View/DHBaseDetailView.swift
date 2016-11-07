//
//  DHBaseDetailView.swift
//  Dota2Helper
//
//  Created by Shvier on 16/10/2016.
//  Copyright © 2016 Shvier. All rights reserved.
//

import UIKit
import WebKit

class DHBaseDetailView: UIView {

    var webView: WKWebView?
    var webViewConfig: WKWebViewConfiguration?
    
    func loadRequest(request: URLRequest) {
        let _ = webView?.load(request)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        webViewConfig = WKWebViewConfiguration()
        webView = WKWebView(frame: CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height - 24), configuration: webViewConfig!)
        self.addSubview(webView!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

}
