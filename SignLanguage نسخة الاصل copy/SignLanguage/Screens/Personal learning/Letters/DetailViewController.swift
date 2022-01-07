//
//  DetailViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 24/05/1443 AH.
//

import UIKit

class DetailViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  @IBOutlet weak var nameLabel: UILabel!
  
  var image = UIImage()
  var name = ""
  override func viewDidLoad() {
        super.viewDidLoad()
    
    nameLabel.text = "\(name)"
    imageView.image = image

        // Do any additional setup after loading the view.
    }
    

}
