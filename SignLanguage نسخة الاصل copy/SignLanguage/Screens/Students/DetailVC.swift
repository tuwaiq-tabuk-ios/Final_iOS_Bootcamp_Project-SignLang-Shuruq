//
//  DetailVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 21/05/1443 AH.
//

import UIKit

class DetailVC: UIViewController {
 
  // MARK: - IBOutlet

  @IBOutlet weak var descriptionLabel: UITextField!
  
  var descriptionText: String = ""
  
  
  //  MARK: - View controller Life Cycle

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
      overrideUserInterfaceStyle = .light

    }
    
  override func viewWillAppear(_ animated: Bool) {
   descriptionLabel.text = descriptionText
 }
    

}
