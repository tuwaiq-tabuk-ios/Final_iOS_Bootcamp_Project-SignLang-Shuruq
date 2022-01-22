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


struct Appointment {
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
    // MARK: - ProPerties
    
    let db = Firestore.firestore()
    let user = Auth.auth().currentUser
    var appointment:[Appointment] = []

    
    //  MARK: - View controller Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        overrideUserInterfaceStyle = .light
        
                
        tableView.delegate = self
        tableView.dataSource = self
        
        getFSCollectionReference(.Appointments).whereField("TeacherId",isEqualTo: user?.uid as Any)
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
                        let newUser = Appointment(fullName: fullName, email: email, date: date)
                        
                        self.appointment.append(newUser)
                        print("****infoStudent: \(self.appointment)\n")
                        print("\n \n \(document.documentID) => \(document.data())\n \n ")
                        
                    }
                    self.tableView.reloadData()
                }
            }
    }
    
   
    // MARK: - Methods
       
     
    
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
        
          
            return appointment.count
        }
   
    
    
    func tableView(_ tableView: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView
            .dequeueReusableCell(withIdentifier: K.Storyboard.appointmentsCell,for: indexPath) as?  AppointmentsCell
        
        let infoUserAD = appointment[indexPath.row]
        
    
            cell!.emailLabel.text = infoUserAD.email
            cell!.dateAndTime.text = infoUserAD.date
            
            print(" \n\n ____ cell \(indexPath.row): \(String(describing: cell))")
            
            return cell!
        }
  
    

       func tableView(_ tableView: UITableView,
                                contextMenuConfigurationForRowAt indexPath: IndexPath,
                                point: CGPoint) -> UIContextMenuConfiguration? {
          
          let delete = UIAction(title: "Delete",
                                image: UIImage(systemName: "trash"),
                                attributes: [.destructive]) { _ in
            // Perform action
              
            
          }
          return UIContextMenuConfiguration(identifier: nil,
                                            previewProvider: nil) { _ in
            UIMenu(children: [delete])
          }
        }
    
}



