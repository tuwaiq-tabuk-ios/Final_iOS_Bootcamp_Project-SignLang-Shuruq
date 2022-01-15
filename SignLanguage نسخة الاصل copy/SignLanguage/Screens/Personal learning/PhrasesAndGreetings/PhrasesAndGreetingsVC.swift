//
//  PhrasesAndGreetingsVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 25/05/1443 AH.
//

import UIKit

class PhrasesAndGreetingsVC: UIViewController {

  // MARK: - IBOutlet
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet weak var nameLabel: UILabel!
  
  var image = UIImage()
  var name = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    overrideUserInterfaceStyle = .light


  nameLabel.text = "\(name)"
  imageView.image = image
    
  }
    
 
}
