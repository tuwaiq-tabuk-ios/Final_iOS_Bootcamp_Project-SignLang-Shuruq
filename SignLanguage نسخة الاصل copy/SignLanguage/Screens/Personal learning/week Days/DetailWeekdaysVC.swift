//
//  DetailWeekdaysVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 25/05/1443 AH.
//

import UIKit

class DetailWeekdaysVC: UIViewController {

  // MARK: - IBOutlet
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var image = UIImage()
  var name = ""
  
  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
        super.viewDidLoad()

    overrideUserInterfaceStyle = .light

        // Do any additional setup after loading the view.
    nameLabel.text = "\(name)"
    imageView.image = image
    
    }
}
