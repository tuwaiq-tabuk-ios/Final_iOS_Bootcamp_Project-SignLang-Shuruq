//
//  DetailNumberViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 25/05/1443 AH.
//

import UIKit

class DetailNumberViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var image = UIImage()
  var name = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    nameLabel.text = "\(name)"
    imageView.image = image
    
    }
}
