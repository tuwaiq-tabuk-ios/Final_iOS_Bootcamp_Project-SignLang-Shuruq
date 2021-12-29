//
//  ViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 23/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

  let name = [ "أ", "ب" , "ت", " ث", "ج" , "ح" , "خ" , "د" , "ذ" ,"ر" , "ز" , "س" , "ش" , "ص" , "ض" , "ع"  , "غ" , "ف" , "ق"
               , "ك" , "ل" , "م" , "ن" , "و" , "ي"]
  
  
  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    //navigationItem.backButtonTitle = ""

  }


}

extension ViewController : UITableViewDelegate , UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return name.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? CellTableViewCell
    cell?.nameLabel.text = name[indexPath.row]
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewController" ) as? DetailViewController
    
    vc?.image = UIImage(named: name[indexPath.row])!
    vc?.name = name[indexPath.row]
    self.navigationController?.pushViewController(vc!, animated: true)
    
    

  }
}
