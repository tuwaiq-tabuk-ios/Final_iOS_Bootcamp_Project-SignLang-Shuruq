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
                             UITableViewDelegate {
  
  
  var detalisVC : DetalisViewController!
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var tableView: UITableView!
  
  
// MARK: - ProPerties
  
  let db = Firestore.firestore()
  var teacherNames : [String] = [""]
  var infoLessors: [InfoLessor] = []
  var filteredTeachers: [InfoLessor] = []
  var isSearching = false
  private let searchBar1 = UISearchController()
  
  
  //  MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    searchLayout()
    
    tableView.delegate = self
    tableView.dataSource = self
    
    db.collection("Teacher").getDocuments() { (querySnapshot, error) in
      if let error = error {
        
        print(error.localizedDescription)
      } else {
        
        if let querySnapshot = querySnapshot {
          
          for document in querySnapshot.documents {
            let data = document.data()
            let fullName = data["fullName"] as? String ?? ""
            
            print("****** full Name : \(fullName) \n")
            
            let email = data["email"] as? String ?? ""
            let info = data["info"] as? String ?? ""
            let uid = data["uid"] as? String ?? ""
            
            
            
            let newUser = InfoLessor(fullName: fullName,
                                     email: email,
                                     info: info,
                                     uid: uid)
            
            
            self.infoLessors.append(newUser)
            self.teacherNames.append(newUser.fullName)
            print("append teacher names to teacherNames array: \(self.teacherNames)")
          }
          self.tableView.reloadData()
        }
      }
    }
  }
  
  // MARK: - Methods
  
  func searchLayout() {
    
    searchBar1.loadViewIfNeeded()
    searchBar1.searchResultsUpdater = self
    searchBar1.obscuresBackgroundDuringPresentation                          = false
    searchBar1.searchBar.returnKeyType                                       = .done
    searchBar1.searchBar.sizeToFit()
    searchBar1.searchBar.placeholder = "Search for a Teacher"
    searchBar1.hidesNavigationBarDuringPresentation                          = false
    definesPresentationContext                                              = true
    
    navigationItem.searchController                                         = searchBar1
    navigationItem.hidesSearchBarWhenScrolling                              = false
    searchBar1.searchBar.delegate                                            = self
    
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
  
}

// MARK: - Table data source

extension TeacherViewController: UITableViewDataSource {
  
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  
  
  func tableView(_ tableView: UITableView,
                 numberOfRowsInSection section: Int) -> Int {
    
    if searchBar1.isActive && !searchBar1.searchBar.text!.isEmpty {
      
      return filteredTeachers.count
      
    } else {
      return infoLessors.count
    }
    
  }
  
  
  func tableView(_ tableView: UITableView,
                 cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView
      .dequeueReusableCell(withIdentifier: K.Storyboard.teacherCellIdenetifier,
                           for: indexPath) as?  selectionTeacher
    
    let infoUserAD = infoLessors[indexPath.row]
    
    
    if searchBar1.isActive && !searchBar1.searchBar.text!.isEmpty {
      
      
      print("\n\n ******* infoUserAD.fullName: \(infoUserAD.fullName)")
      print("******* infoUserAD.email: \(infoUserAD.email)")
      
      cell?.nameTeacher.text = "\(filteredTeachers[indexPath.row].fullName)"

      cell?.emailLabel.text = "\(filteredTeachers[indexPath.row].email)"
   
      
      print(" \n\n ____ cell \(indexPath.row): \(String(describing: cell))")
      return cell!
      
    } else {
      
      
      print("\n\n ******* infoUserAD.fullName: \(infoUserAD.fullName)")
      print("******* infoUserAD.email: \(infoUserAD.email)")
      
      cell?.nameTeacher.text = "\(infoUserAD.fullName)"
      cell?.emailLabel.text = "\(infoUserAD.email)"
      
      print(" \n\n ____ cell \(indexPath.row): \(String(describing: cell))")
      return cell!
    }
    
  }
}

extension TeacherViewController: UISearchBarDelegate,
                                 UISearchResultsUpdating,
                                 UISearchControllerDelegate {
  
  
  func updateSearchResults(for searchController: UISearchController) {
    
    if !searchController.isActive {
      return
    }
    
    let searchBar = searchBar1.searchBar
    
    if let userEnteredSearchText = searchBar.text {
      
      findResultsBasedOnSearch(with: userEnteredSearchText)
      print("****** user text : \(userEnteredSearchText)")
      
    }
    
  }
  
  private func findResultsBasedOnSearch(with text: String)  {
    
    filteredTeachers.removeAll(keepingCapacity: false)
    
    if !text.isEmpty {
      filteredTeachers = infoLessors.filter { item in
        item.fullName.lowercased().contains(text.lowercased())
      }
      tableView.reloadData()
      
    } else {
      
      tableView.reloadData()
    }
  }
  
}
