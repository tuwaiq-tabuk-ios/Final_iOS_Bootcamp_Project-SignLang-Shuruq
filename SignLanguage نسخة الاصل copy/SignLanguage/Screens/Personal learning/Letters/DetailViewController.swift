//
//  DetailViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 24/05/1443 AH.
//

import UIKit

class DetailViewControllers: UIViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var image = UIImage()
  var name = ""
  
  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
        super.viewDidLoad()
    
    
    overrideUserInterfaceStyle = .light

    nameLabel.text = "\(name)"
    imageView.image = image

        // Do any additional setup after loading the view.
    }
    

}
