//
//  Zoom.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 07/05/1443 AH.
//

import Foundation

import UIKit
import WebKit


class zoom : UIViewController, WKUIDelegate {
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        view = webView
    }
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string:"https://zoom.us")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }}
