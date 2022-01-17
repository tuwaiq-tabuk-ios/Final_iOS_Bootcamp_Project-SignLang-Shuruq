//
//  teacherTableViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 01/06/1443 AH.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import CoreAudio

struct InfoLessor {
  var fullName: String
  var email: String
  var info: String
  var uid : String
  
  
  var disctionary:[String: Any] {
    
    return [
      "fullName": fullName,
      "email": email,
      "info": info,
      "uid": uid]
      }
  
}


class TeacherViewController: UIViewController,
                             //UISearchResultsUpdating,
                             //UISearchBarDelegate,
                             UITableViewDelegate {
  
  
  var detalisVC : DetalisViewController!
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var tableView: UITableView!
  @IBOutlet weak var searchBar: UISearchBar!
  
  let db = Firestore.firestore()
  
  var infoLessors = [InfoLessor]()
  let teachers: [Teacher] = []
  var filteredTeachers: [InfoLessor]!
  var isSearching = false
  private let searchBar1 = UISearchController()

  
  //  MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    
    tableView.delegate = self
    tableView.dataSource = self

    filteredTeachers = infoLessors
    
    db.collection("Teacher").getDocuments() { (querySnapshot, error) in
      if let error = error {
        
        print(error.localizedDescription)
      } else {
        
        if let querySnapshot = querySnapshot {
          
          for document in querySnapshot.documents {
            let data = document.data()
            let fullName = data["fullName"] as? String ?? ""
            let email = data["email"] as? String ?? ""
            let info = data["info"] as? String ?? ""
            let uid = data["uid"] as? String ?? ""
            
            
            
            let newUser = InfoLessor(fullName: fullName,
                                     email: email,
                                     info: info,
                                     uid: uid)
            
            
            self.infoLessors.append(newUser)
          }
          self.tableView.reloadData()
        }
      }
    }
  }
  
  
  func tableView(_ tableView: UITableView,
                 heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // If the triggered segue is the "showItem" segue
    switch segue.identifier {
    case "showDetail":
      // Figure out which row was just tapped
      if let row = tableView.indexPathForSelectedRow?.row {
        // Get the item associated with this row and pass it along
        let fullName = infoLessors[row].fullName
        print("\n\n** the fullname from prepare: \(fullName)\n\n")
        
        let email = infoLessors[row].email
        print("\n\n** the email from prepare: \(email)\n\n")
        
        let uid = infoLessors[row].uid
        
        
        let detailViewController = segue.destination as! DetalisViewController
        
        detailViewController.fullName = fullName
        detailViewController.email = email
        
        detailViewController.uid = uid
        print(" \n\n ********** \(uid)")
      } default:
      preconditionFailure("Unexpected segue identifier.")
    }
  }
 
  
//  func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
//         isSearching = true
//     }
//     
//
//     func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
//         isSearching = false
//     }
//     
//
//     func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
//         isSearching = false
//         searchBar.text = ""
//         view.endEditing(true)
//         self.tableView.reloadData()
//     }
//     
//
//     func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//         if searchText == "" {
//             isSearching = false
//           
//             self.tableView.reloadData()
//         } else {
//             isSearching = true
//             filteredTeachers = infoLessors.filter({ item in
//               
//               
//                 return infoLessors.fullName.lowercased().contains(searchText.lowercased())
//             })
//             self.tableView.reloadData()
//         }
//}
//
//  
//  func updateSearchResults(for searchController: UISearchController) {
//    
//    if !searchController.isActive {
//        return
//    }  }
//  
  
}

// MARK: - Table data source

extension TeacherViewController: UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    return infoLessors.count
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView
      .dequeueReusableCell(withIdentifier: K.Storyboard.teacherCellIdenetifier,
                           for: indexPath) as?  selectionTeacher
    
    let infoUserAD = infoLessors[indexPath.row]
    
    print("\n\n ******* infoUserAD.fullName: \(infoUserAD.fullName)")
    print("******* infoUserAD.email: \(infoUserAD.email)")
    
    cell?.nameTeacher.text = "\(infoUserAD.fullName)"
    cell?.emailLabel.text = "\(infoUserAD.email)"
    
    print(" \n\n ____ cell \(indexPath.row): \(String(describing: cell))")
    return cell!
  }
  
}
