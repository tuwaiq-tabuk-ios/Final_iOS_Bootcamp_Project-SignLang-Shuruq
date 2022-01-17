//
//  InfoTeacherVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 08/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class InfoTeacherVC: UIViewController {
  
  private var UserChoseDate = ""

  // MARK: - IBOutlet

  @IBOutlet weak var nameTF: UITextField!
  @IBOutlet weak var emailTF: UITextField!
  @IBOutlet weak var experTF: UITextField!
  @IBOutlet weak var infoTF: UITextField!
  @IBOutlet weak var datePicker: UIDatePicker!
  
  let db = Firestore.firestore()
  
 var fullName = ""
  var email = ""
  var info = ""
  var exper = 0
  
  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
        super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light

  }
  
  // MARK: - IBAction
  
  @IBAction func saveButt(_ sender: Any) {
    
    db.collection("Teacher").document(Auth.auth().currentUser!.uid).updateData(["fullName": fullName, "email": email,"info": info, "exper": exper, "datePicker": ("\(datePicker.date)")])  {  err in
      
          if let  err1 = err {
            print("Error updating document: \(err1)")
          } else {
            print("Document successfully updated")
          }
          }
        }
    
}
