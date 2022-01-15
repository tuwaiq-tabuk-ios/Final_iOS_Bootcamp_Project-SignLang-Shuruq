//
//  ZoomTeacher.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 11/06/1443 AH.
//

import UIKit

class PageSettings: UIViewController {

  @IBOutlet weak var appointments: UIButton!
  
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light


        // Do any additional setup after loading the view.
    }
    
  @IBAction func appointmentsButt(_ sender: Any) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController2 = storyBoard.instantiateViewController(withIdentifier: "appointmentsTeacher") as! Appointments
    self.present(nextViewController2, animated:true, completion:nil)

  }

  @IBAction func ZoomButt(_ sender: Any) {
    
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController2 = storyBoard.instantiateViewController(withIdentifier: "Zooms") as! zoom
    self.present(nextViewController2, animated:true, completion:nil)
  }
  
}
