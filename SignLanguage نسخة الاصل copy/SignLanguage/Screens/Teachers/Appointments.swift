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


struct InfoLessores {
  var fullName: String
  var email: String
  
  var disctionary:[String: Any] {
    
    return [
      "fullName": fullName,
      "email": email]
  }
}

// the best way create document new inside full Name , email , teacherId  and studentId

class Appointments: UIViewController ,
                    UITableViewDelegate,
                    UISearchBarDelegate  {
  
  @IBOutlet weak var seacherBar: UISearchBar!
  @IBOutlet weak var addButton: UIButton!
  
  
  var infoStudent = [InfoLessores]()
  
  @IBOutlet weak var tableView: UITableView!
  
  let db = Firestore.firestore()
  let user = Auth.auth().currentUser
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    
    // Do any additional setup after loading the view.
    tableView.delegate = self
    tableView.dataSource = self
    
    db.collection("Appointments").whereField("TeacherId",isEqualTo: user?.uid)
      .getDocuments() { (querySnapshot, err) in
        if let err = err {
          print("Error getting documents: \(err)")
        } else {
          for document in querySnapshot!.documents {
            let data = document.data()
            
            let fullName = data["fullName"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            
            let newUser = InfoLessores(fullName: fullName, email: email)
            
            self.infoStudent.append(newUser)
            print("\n \n \(document.documentID) => \(document.data())\n \n ")
            
          }
          self.tableView.reloadData()
        }
      }
  }
  
  
  //    db.collection("Appointments").getDocuments() { (querySnapshot, error) in
  //
  //    if let error = error {
  //
  //      print(error.localizedDescription)
  //    } else {
  //
  //      if let querySnapshot = querySnapshot {
  //
  //        for document in querySnapshot.documents {
  //          let data = document.data()
  //          let fullName = data["fullName"] as? String ?? ""
  //          let email = data["email"] as? String ?? ""
  //
  //          let newUser = InfoLessores(fullName: fullName, email: email)
  //
  //          self.infoStudent.append(newUser)
  //        }
  //        self.tableView.reloadData()
  //      }
  //    }
  
  
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
    
    
    cell!.emailLabel.text = infoUserAD.email
    
    //    cell?.nameLabel.text = ("\(infoUserAD.fullName)")
    //    cell?.emailLabel.text = ("\(infoUserAD.email)")
    
    print(" \n\n ____ cell \(indexPath.row): \(String(describing: cell))")
    
    return cell!
  }
  
}

