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
    
  // MARK: - IBOutlet

  @IBOutlet weak var myView: UIView!
  
  //  MARK: - View controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()
      
      
      overrideUserInterfaceStyle = .light
      
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
  
