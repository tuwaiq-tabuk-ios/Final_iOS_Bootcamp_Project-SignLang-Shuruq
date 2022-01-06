//
//  searchResultsController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 03/05/1443 AH.
//

import UIKit
import WebKit


class SearchResultsController : UIViewController, WKUIDelegate  {
    
  let webView = WKWebView()
    

  @IBOutlet weak var myView: UIView!
  
    override func viewDidLoad() {
        super.viewDidLoad()
      
     myView.addSubview(webView)
      guard let myURL = URL(string:"https://www.youtube.com/results?search_query=Sign+Language+Lessons+in+the+Middle+East") else {
        return
      }
      webView.load(URLRequest(url: myURL))
    }
  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    webView.frame = view.bounds
  }
  
}
  
