//
//  WebView.swift
//  NewsApp
//
//  Created by Prasad Prabhu on 30/03/20.
//  Copyright © 2020 Prasad D Prabhu. All rights reserved.
//

import Foundation
import WebKit
import SwiftUI

struct WebView : UIViewRepresentable {
    var url: String?
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
        
    }
    func makeUIView(context: Context) -> WKWebView {
       guard let urls = url else{
             return WKWebView()
        }
        guard let webUrl = URL(string: urls) else {
            return WKWebView()
        }
        let request = URLRequest(url: webUrl)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }
}
