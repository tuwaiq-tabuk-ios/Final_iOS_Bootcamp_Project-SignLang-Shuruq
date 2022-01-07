//
//  ViewController.swift
//  prototype-Navigation-colloction"BushraO-Shrooq"
//
//  Created by Bushra alatwi on 25/04/1443 AH.
//

import UIKit

class DetailVC: UIViewController {

  var item: Item?
  
  
  @IBOutlet private weak var descriptionTextField: UITextField!
    
  
  override func viewWillAppear(_ animated: Bool) {
    descriptionTextField.text = item?.description
   }

}
