//
//  ViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 23/04/1443 AH.
//

import UIKit

class ViewController: UIViewController {

  
  let name = ["الالف", "الباء" , "التاء", "الثاء", "الجيم" , "الحاء" , "الخاء" , "دال" , "ذال" ,"راء" , "زاء" , "سين" , "شين" , "صاء" , "ضاء" ,"طاء","ظاء", "عين"  , "غين" , "فاء" , "قاف"
               , "كاف" , "لام" , "ميم" , "نون" ,"هاء", "واو" , "ياء"]
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var tableView: UITableView!
  
  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    overrideUserInterfaceStyle = .light

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
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell",
                                             for: indexPath) as? CellTableViewCell
    cell?.nameLabel.text = name[indexPath.row]
    return cell!
  }
  
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let vc = storyboard?.instantiateViewController(withIdentifier: "DetailViewControllers" ) as? DetailViewControllers
    
    vc?.image = UIImage(named: name[indexPath.row])!
    vc?.name = name[indexPath.row]
    
    self.navigationController?.pushViewController(vc!, animated: true)
    
  }
}
