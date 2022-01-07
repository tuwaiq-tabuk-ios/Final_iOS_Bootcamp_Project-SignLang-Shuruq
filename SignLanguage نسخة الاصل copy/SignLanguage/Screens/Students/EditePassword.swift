//
//  EditePassword.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 01/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
import CoreMedia

class EditePassword: UIViewController {
  
  let db = Firestore.firestore()


  @IBOutlet weak var editePasswordTF: UITextField!
  @IBOutlet weak var saveButton: UIButton!
  
  var  Password = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    let user = Auth.auth().currentUser
    print(user?.uid)
    
    if let currentUser = user {
      db.collection("student").document(currentUser.uid).getDocument { doc, err in
        
        if err != nil {
          print(err)
        } else {
          let data = doc!.data()!
          
          self.editePasswordTF.text = self.Password
        }
      }
    }
  }
    
  @IBAction func savePassword(_ sender: Any) {
    
    Auth.auth().currentUser?.updatePassword(to: editePasswordTF.text!) { [self] error in
      
      if error == nil {
        let ref = db.collection("student").document(Auth.auth().currentUser!.uid)
        
        ref.updateData(["password": editePasswordTF.text!]) { err in
          if let err = err {
            print("ERROR Updating document : \(err)")
          } else {
            print("Document Succeddfully updated")
          }
        }
      }
      
    }
  }
  
}
