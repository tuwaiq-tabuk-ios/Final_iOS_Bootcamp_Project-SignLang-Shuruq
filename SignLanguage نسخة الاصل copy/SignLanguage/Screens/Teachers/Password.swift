//
//  Password.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 30/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class Password: UIViewController {
  let db = Firestore.firestore()

  @IBOutlet weak var newPasswordTF: UITextField!
  @IBOutlet weak var saveButton: UIButton!
  
  var Password = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    // Do any additional setup after loading the view.
let user = Auth.auth().currentUser
print(user?.uid)

if let currentUser = user {
  db.collection("Teacher").document(currentUser.uid).getDocument { doc, err in
    
    if err != nil {
      print(err)
    } else {
      let data = doc!.data()!
      
      self.newPasswordTF.text = self.Password
    }
  }
}
}

    
  @IBAction func updatePassword(_ sender: Any) {
    
    Auth.auth().currentUser?.updatePassword(to: newPasswordTF.text!) { [self] error in
      
      if error == nil {
        let ref = db.collection("Teacher").document(Auth.auth().currentUser!.uid)
        
        ref.updateData(["password": newPasswordTF.text!]) { err in
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
  

