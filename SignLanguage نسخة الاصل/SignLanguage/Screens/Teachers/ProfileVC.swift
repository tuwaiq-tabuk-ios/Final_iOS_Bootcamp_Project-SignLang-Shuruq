//
//  ProfileVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 30/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class ProfileVC: UIViewController {
  
  let db = Firestore.firestore()
  
  
  @IBOutlet weak var firstnameTF: UITextField!
  @IBOutlet weak var lastnameTF: UITextField!
  @IBOutlet weak var EmailTF: UITextField!
  @IBOutlet weak var phoneNumberTF: UITextField!
  @IBOutlet weak var userNameTF: UITextField!
  
  var firstName = "nil"
  var lastName = "nil"
  var email = "nil"
  var phonenumber = 0
  var username = "nil"
  
  
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
          self.EmailTF.text = self.email
          
          self.firstName = data["firstname"] as! String
          self.firstnameTF.text = self.firstName
          
          self.lastName = data["lastname"] as! String
          self.lastnameTF.text = self.lastName
          
//       self.phonenumber = ["phoneNumber"] as! Int
//       self.phoneNumberTF.text = self.phonenumber

          self.username = data["User name"] as! String
          self.userNameTF.text = self.username
          
          
          
          
        }
      }
    }
//    
//    db.collection("Teacher").document(Auth.auth().currentUser!.uid).updateData(["firstname":self.firstName,"lastname":self.lastName ], completion: <#T##((Error?) -> Void)?##((Error?) -> Void)?##(Error?) -> Void#>)

          //           self.firstnameTF.text = self.firstName
          //           self.lastnameTF.text = self.lastName
                    
          //           self.phoneNumberTF.hashValue = self.phonenumber
          //           self.userNameTF.text = self.username

        
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
  }
  
  @IBAction func sendProfile(_ sender: Any) {
    
      Auth.auth().currentUser?.updateEmail(to: EmailTF.text!) { [self] error in
           if error == nil{
            let washingtonRef = db.collection("Teacher").document(Auth.auth().currentUser!.uid)
            washingtonRef.updateData([
              "email": EmailTF.text!
            ]) { err in
              if let err = err {
                print("Error updating document: \(err)")
              } else {
                print("Document successfully updated")
              }
            }
    
           }
          }
    
    
//    Auth.auth().currentUser?.updatePhoneNumber(phoneNumberTF.text) { [self] error in
//      if error == nil{
//          let washingtonRef = db.collection("Teacher").document(Auth.auth().currentUser!.uid)
//          washingtonRef.updateData([
//            "email": EmailTF.text!
//          ]) { err in
//            if let err = err {
//              print("Error updating document: \(err)")
//            } else {
//              print("Document successfully updated")
//            }
//          }
//
//         }
//        }
//  }
//
  
}

}

