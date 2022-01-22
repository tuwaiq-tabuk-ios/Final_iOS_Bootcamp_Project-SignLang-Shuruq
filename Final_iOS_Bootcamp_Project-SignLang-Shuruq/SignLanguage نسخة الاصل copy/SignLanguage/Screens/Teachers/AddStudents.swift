//
//  SelectDate.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 30/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class AddStudents: UIViewController {
  
  // MARK: - ProPerties

  var fullName: String = ""
  var email: String = ""
  var uid: String = ""
  var info : String = ""
  let db = Firestore.firestore()
  let user = Auth.auth().currentUser
  
  // MARK: - IBOutlet

  
  @IBOutlet weak var nameTF: UITextField!
  @IBOutlet weak var emailTF: UITextField!
  
  
  //  MARK: - View controller Life Cycle

  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    
    nameTF.text = fullName
    emailTF.text = email
    
  }
  
  // MARK: - IBAction

  
  @IBAction func AddButt(_ sender: Any) {
    
    let fullName = nameTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let email = emailTF.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    
    db.collection("Appointments").addDocument(data: ["fullName":fullName,
                                                     "email": email,
                                                     "studentId": user!.uid,
                                                     "TeacherId": uid])
    
    
  }
}



