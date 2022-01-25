//
//  EditeProfile.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 01/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
import CoreMedia

class EditeProfile: UIViewController {
  
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var fullNameTF: UITextField!
  @IBOutlet weak var emailTF: UITextField!
  
  // MARK: - ProPerties

  var fullName = "nil"
  var email = "nil"
  let db = Firestore.firestore()
  
  //  MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    
    // Do any additional setup after loading the view.
    
    let user = Auth.auth().currentUser
    print("\n\n\n****** THE CURRENT USER ID:: \(String(describing: user?.uid))")
    
    if let currentUser = user {
      
      getFSCollectionReference(.student).document(currentUser.uid).getDocument { doc, err in
        if err != nil {
          print("\n\n\n**** AN ERROR OCUURED:: \(String(describing: err))")
        } else {
          let data = doc!.data()
          print("\n\n\n****** THE DATA::\(String(describing: data))")
          
          self.email = (user?.email)!
          self.emailTF.text = self.email
          
          self.fullName = (data?["fullName"] as? String)!
          self.fullNameTF.text = self.fullName
          
        }
        
      }
    }
    
  }
  
  // MARK: - IBAction
  
  @IBAction func sendProfile(_ sender: Any) {
    
    Auth.auth().currentUser?.updateEmail(to: emailTF.text!) { [self] error in
      if error == nil{
        let washingtonRef = getFSCollectionReference(.student)
              .document(Auth.auth().currentUser!.uid)
          
        washingtonRef.updateData([
          "email": emailTF.text!
        ]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            print("Document successfully updated")
          }
        }
        
      }
    }
    
      getFSCollectionReference(.student).document(Auth.auth().currentUser!.uid).updateData(["fullnmae" :fullName])  {  err in
      
      if let  err1 = err {
        print("Error updating document: \(err1)")
      } else {
        print("Document successfully updated")
      }
    }
  }
}
