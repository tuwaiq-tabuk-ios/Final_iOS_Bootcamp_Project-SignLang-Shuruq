//
//  Appointments.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 05/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
//import SwiftUI


struct InfoLessores {
  var fullName: String
  var email: String
  var date : String

  
  
  var disctionary:[String: Any] {
    
    return [
      "fullName": fullName,
      "email": email,
      "datePicker": date]
  }
}


class Appointments: UIViewController ,
                    UITableViewDelegate {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var addButton: UIButton!
  @IBOutlet weak var tableView: UITableView!
  
  let db = Firestore.firestore()
  let user = Auth.auth().currentUser
  var infoStudent = [InfoLessores]()
  
  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
    
    db.collection("Appointments").whereField("TeacherId",isEqualTo: user?.uid as Any)
      .getDocuments() { (querySnapshot, err) in
        if let err = err {
          print("Error getting documents: \(err)")
        } else {
          for document in querySnapshot!.documents {
            let data = document.data()
            
            let fullName = data["fullName"] as? String ?? ""
             let email = data["email"] as? String ?? ""
             let date = data["datePicker"] as? String ?? ""
            
            print("****date: \(date)\n")
            let newUser = InfoLessores(fullName: fullName, email: email, date: date)
            
            self.infoStudent.append(newUser)
            print("****infoStudent: \(self.infoStudent)\n")
            print("\n \n \(document.documentID) => \(document.data())\n \n ")
            
          }
          self.tableView.reloadData()
        }
      }
  }
  

  
  func tableView(_ tableView: UITableView,
                 heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
}

extension Appointments : UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return infoStudent.count
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView
      .dequeueReusableCell(withIdentifier: K.Storyboard.appointmentsCell,for: indexPath) as?  AppointmentsCell
    
    let infoUserAD = infoStudent[indexPath.row]
    
    print("\n\n ******* infoUserAD.fullName: \(infoUserAD.fullName)")
    print("******* infoUserAD.email: \(infoUserAD.email)")
    print("******* infoUserAD.date: \(infoUserAD.date)")
    
    cell!.emailLabel.text = infoUserAD.email
    cell!.dateAndTime.text = infoUserAD.date
   
    print(" \n\n ____ cell \(indexPath.row): \(String(describing: cell))")
    
    return cell!
  }
  
}

//extension Appointments {
//
//  func sendDate() -> String {
//      let formatter = DateFormatter()
//      formatter.dateFormat = "dd-M-YYYY"
//      let currentDate = formatter.string(from: Date())
//      return currentDate
//  }
//}
