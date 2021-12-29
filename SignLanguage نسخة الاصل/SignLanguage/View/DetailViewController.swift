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
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
