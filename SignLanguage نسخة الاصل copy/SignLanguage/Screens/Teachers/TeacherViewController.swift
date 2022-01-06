//
//  teacherTableViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 01/06/1443 AH.
//

import UIKit

class TeacherViewController: UIViewController,UITableViewDelegate,UITableViewDataSource, UISearchBarDelegate {


  @IBOutlet weak var searchBar: UISearchBar!
  
  @IBOutlet weak var tableView: UITableView!
  
  let teacher:[Teacher] = array
  var data:[Teacher]!
  
    override func viewDidLoad() {
        super.viewDidLoad()

      tableView.delegate = self
     tableView.dataSource = self
      data = teacher
      
    }
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 150
    
  }
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
   
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return teacher.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Celles", for: indexPath) as?  selectionTeacher
    
//   if data.count != 0 {
//    cell?.teacherImage.image = data[indexPath.row].images
//   } else {
//     cell?.teacherImage.image = teacher[indexPath.row].images
//   }
//    
    return cell!
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    switch segue.identifier {
      case "showDetail":

        if let row = tableView.indexPathForSelectedRow?.row {
         
              let detailsViewController = segue.destination as! DetalisViewController
//          detailsViewController.array = data[row]


        } default:
          preconditionFailure("Unexpected segue identifier.")
      }
  }
  
  func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
    data = searchText.isEmpty ? data : data.filter {
      (item : Teacher) -> Bool in
      
      return item.firstname.range(of: searchText, options: .caseInsensitive , range: nil,locale: nil) != nil
    }
    
    tableView.reloadData()
  }

}

