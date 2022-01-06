//
//  DetailVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 21/05/1443 AH.
//

import UIKit

class DetailVC: UIViewController {
 
  @IBOutlet weak var descriptionLabel: UITextField!
  
  var descriptionText: String = ""
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  override func viewWillAppear(_ animated: Bool) {
   descriptionLabel.text = descriptionText
 }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
