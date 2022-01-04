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
  
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
  @IBAction func updatePassword(_ sender: Any) {
    
    Auth.auth().currentUser?.updateEmail(to: newPasswordTF.text!) { [self] error in
       if error == nil{
        let washingtonRef = db.collection("Teacher").document(Auth.auth().currentUser!.uid)
        washingtonRef.updateData([
          "email": newPasswordTF.text!
        ]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            print("Document successfully updated")
          }
        }
       }else{
        print("error\(error?.localizedDescription)")
       }
      }
  
  
}
  }
  
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


