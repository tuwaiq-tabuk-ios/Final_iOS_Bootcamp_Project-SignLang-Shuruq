//
//  NumberViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 25/05/1443 AH.
//

import UIKit

class NumberViewController: UIViewController {

  let numbers = [ "١", "٢" , "٣", "٤", "٥" , "٦" , "٧" , "٨" , "٩" ,"١٠" , "١١" , "١٢" , "١٣" , "١٤" , "١٥" , "١٦"  , "١٧" , "١٨" , "١٩", "٢٠" , "٢١" , "٢٢" , "٣٠" , "١٠٠"]
  
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

extension NumberViewController : UITableViewDelegate , UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return numbers.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Celles", for: indexPath) as? CellTableViewCell
    cell?.nameLabel.text = numbers[indexPath.row]
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "DetailNumberViewController" ) as? DetailNumberViewController
    
    var namenumber = numbers[indexPath.row]
    print(namenumber)
    vc?.image = UIImage(named: numbers[indexPath.row])!
    vc?.name = numbers[indexPath.row]
    self.navigationController?.pushViewController(vc!, animated: true)
    
    

  }
}
