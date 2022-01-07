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
  
  let db = Firestore.firestore()

  
  @IBOutlet weak var firstNameTF: UITextField!
  @IBOutlet weak var lastNameTF: UITextField!
  @IBOutlet weak var emailTF: UITextField!
  
  var firstName = "nil"
  var lastName = "nil"
  var email = "nil"
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
   
    let user = Auth.auth().currentUser
    print("\n\n\n****** THE CURRENT USER ID:: \(String(describing: user?.uid))")
    
    if let currentUser = user {
      db.collection("Teacher").document(currentUser.uid).getDocument { doc, err in
        if err != nil {
          print("\n\n\n**** AN ERROR OCUURED:: \(String(describing: err))")
        } else {
          let data = doc!.data()!
          print("\n\n\n****** THE DATA::\(data)")
          
          
          self.email = (user?.email)!
          self.emailTF.text = self.email
          
          self.firstName = data["firstname"] as! String
          self.firstNameTF.text = self.firstName
          
          self.lastName = data["lastname"] as! String
          self.lastNameTF.text = self.lastName
          
  }
    
}
    }
    
  }
  @IBAction func sendProfile(_ sender: Any) {
    
    Auth.auth().currentUser?.updateEmail(to: emailTF.text!) { [self] error in
         if error == nil{
          let washingtonRef = db.collection("student").document(Auth.auth().currentUser!.uid)
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
  
  db.collection("Teacher").document(Auth.auth().currentUser!.uid).updateData(["firstname" :firstName, "lastname": lastName])  {  err in
    
        if let  err1 = err {
          print("Error updating document: \(err1)")
        } else {
          print("Document successfully updated")
        }
        }
      }
    }
