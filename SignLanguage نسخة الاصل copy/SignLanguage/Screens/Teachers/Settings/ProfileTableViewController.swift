//
//  ProfileTableViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 21/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth


class ProfileTableViewController: UIViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var editeProfile: UIButton!
  @IBOutlet weak var editePassword: UIButton!
  @IBOutlet weak var Delete: UIButton!
  @IBOutlet weak var signOut: UIButton!
  
  var Teacher: Teacher?
  
  let db = Firestore.firestore()

  
  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
        super.viewDidLoad()

    overrideUserInterfaceStyle = .light

    }

  // MARK: - IBAction
  @IBAction func editeProfile(_ sender: Any) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "Profile") as! ProfileVC
    self.present(nextViewController, animated:true, completion:nil)
  }
  
  @IBAction func editePassword(_ sender: Any) {
    
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController3 = storyBoard.instantiateViewController(withIdentifier: "Password") as! Password
    self.present(nextViewController3, animated:true, completion:nil)
  
  
  }
  
  @IBAction func DeleteButt(_ sender: Any) {
    
    let user = Auth.auth().currentUser
      
      user?.delete { error in
        
        if let error = error {
          print("******\(error)")
          
        } else {
          
          print("Account Deleted")
      }
  
  }
    
  }
  
  @IBAction func signOut(_ sender: Any) {
    
    do {
      try Auth.auth().signOut()
      
      if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "WelcomeVC") as? UINavigationController {
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true, completion: nil)
      }
    } catch {
      print("ERROR")
    }
  
}

}
