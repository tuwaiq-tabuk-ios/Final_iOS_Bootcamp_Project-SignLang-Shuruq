//
//  TeacherTableVCell.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 03/06/1443 AH.
//

import UIKit
import Firebase

class DetalisViewController: UIViewController {

  var selectionCell : selectionTeacher!
  let db = Firestore.firestore()

  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var picture: UIImageView!
  @IBOutlet weak var reservationButt: UIButton!
  
  
    
  
  var fullName: String = ""
  var email: String = ""
  var uid: String = ""
  var info : String = ""
  
  override func viewDidLoad() {
        super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light

    
    print("\n\n***The fullName in DetailsViewController: \(fullName)\n\n")
    print("\n\n***The email in DetailsViewController: \(email)\n\n")
    
    nameLabel.text = fullName
    emailLabel.text = email
   print("\n\n \n *******\(uid)\n \n \n ")
    
   

  }
  
  @IBAction func reservationButt(_ sender: Any) {
    
    
    let fullName = nameLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    let email = emailLabel.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    
    let user = Auth.auth().currentUser
        
   // print("\(String(describing: user?.uid))")
    
    print("**************\(String(describing: user?.providerData))")
    
    
    db.collection("Appointments").addDocument(data: ["fullName":fullName,
                                                     "email":user?.email,
                                                     "studentId": user!.uid,
                                                     "TeacherId": uid])


    }
  }

//    let reservation = self.storyboard?.instantiateViewController(identifier: K.Storyboard.appointments) as? InfopersonalVC
//    
//    self.view.window?.rootViewController = reservation
//    self.view.window?.makeKeyAndVisible()
//    
//  }

  

