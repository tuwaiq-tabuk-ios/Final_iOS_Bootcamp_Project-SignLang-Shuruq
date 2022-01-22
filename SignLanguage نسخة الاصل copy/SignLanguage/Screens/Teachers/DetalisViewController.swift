//
//  TeacherTableVCell.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 03/06/1443 AH.
//

import UIKit
import Firebase

class DetalisViewController: UIViewController {
  
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var nameLabel: UILabel!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var picture: UIImageView!
  @IBOutlet weak var dateAndTime: UIDatePicker!
  @IBOutlet weak var reservationButt: UIButton!
  
  // MARK: - ProPerties

  let db = Firestore.firestore()
  var fullName: String = ""
  var email: String = ""
  var uid: String = ""
  var info : String = ""
  
  //  MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    
    print("\n\n***The fullName in DetailsViewController: \(fullName)\n\n")
    print("\n\n***The email in DetailsViewController: \(email)\n\n")
    
    nameLabel.text = fullName
    emailLabel.text = email
    
    print("\n\n \n *******\(uid)\n \n \n ")
    
    
    
  }
  
  // MARK: - IBAction
  
  @IBAction func reservationButt(_ sender: Any) {
    
    
    let user = Auth.auth().currentUser
    
    // print("\(String(describing: user?.uid))")
    
    print("**************\(String(describing: user?.providerData))")
    _ = UUID().uuidString
    
    let formatter = DateFormatter()
    formatter.dateFormat = "dd-M-YYYY"
    
    let strDate = formatter.string(from: dateAndTime.date)
    
    db.collection("Appointments").addDocument(data: ["email": user?.email as Any,
                                                     "studentId": user!.uid,
                                                     "TeacherId": uid,
                                                     "datePicker" : strDate])
      showAppointmentOverAlertMessage()
  }
 
    
    func showAppointmentOverAlertMessage() {
      
      let ac = UIAlertController(title: "Thank you",
                                 message: "Teacher booked ",
                                 preferredStyle: .alert
      )
      
      ac.addAction(UIAlertAction(title: "Done",
                                 style: .default,handler: nil))
      present(ac, animated: true)
    }
}

