//
//  Settings.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 03/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class ProfileStudents: UIViewController {
  
 // MARK: - IBOutlet
  
  @IBOutlet weak var editeProfile: UIButton!
  @IBOutlet weak var editePassword: UIButton!
  @IBOutlet weak var signOut: UIButton!
  @IBOutlet weak var Delete: UIButton!
  
  var students:Students?
  
  let db = Firestore.firestore()

  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
     super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light

  }
  
  // MARK: - IBAction

  
  @IBAction func editeProfile(_ sender: Any) {
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EditeProfile") as! EditeProfile
    self.present(nextViewController, animated:true, completion:nil)
  }
  
  @IBAction func editePassword(_ sender: Any) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController2 = storyBoard.instantiateViewController(withIdentifier: "EditePassword") as! EditePassword
    
    self.present(nextViewController2, animated:true, completion:nil)    
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




