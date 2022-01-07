//
//  SignlanguageTeachers.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 16/05/1443 AH.
//

import UIKit
import Firebase

class SignlanguageTeachers : UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //navigationItem.backButtonTitle = ""
    
    // Configure the view for the selected state
  let db = Firestore.firestore()
  
  let docRef = db.collection("Teacher").document("Teacher")

  docRef.getDocument { (document, error) in
      if let document = document, document.exists {
          let dataDescription = document.data().map(String.init(describing:)) ?? "nil"
          print("Document data: \(dataDescription)")
      } else {
          print("Document does not exist")
      }
  }

  }


}
