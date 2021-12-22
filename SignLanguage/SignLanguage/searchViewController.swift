//
//  seachViewControllers.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 03/05/1443 AH.
//

import Foundation
import UIKit


class searchViewController :UIViewController {
  
  let searchController: UISearchController = {
    let results = UIViewController()
    results.view.backgroundColor = .gray
    
    let vc = UISearchController(searchResultsController: results)
  //   vc.storyboard.placeholder = " Sign language ,Learn "
    vc.searchBar.searchBarStyle = .minimal
    vc.definesPresentationContext = true
    return vc
    
  }()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = .systemBackground
    //  navigationController?.searchDisplayController = searchController
    
    
    
  }
  
}
