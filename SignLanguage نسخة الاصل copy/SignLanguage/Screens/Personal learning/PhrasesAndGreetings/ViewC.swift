//
//  ViewC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 25/05/1443 AH.
//

import UIKit

class ViewC: UIViewController {

  let PhrasesAndGreetings = ["أحبك", "‎⁨أراك لاحقا⁩" , "أنا اراقبك" , "‎⁨اتمنى لك حياة سعيدة" , "اقتباس", "انت⁩","سوال", "عمل جيد⁩","لا⁩","‎⁨لست متاكد⁩","موافق","‎⁨هذا رهيب⁩","هذا ممتاز⁩" ]
  
  // MARK: - IBOutlet

  
  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    overrideUserInterfaceStyle = .light

    }
  
}

extension ViewC : UITableViewDelegate , UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return PhrasesAndGreetings.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cells", for: indexPath) as? CellTableViewCell
    cell?.nameLabel.text = PhrasesAndGreetings[indexPath.row]
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "PhrasesAndGreetingsVC" ) as? PhrasesAndGreetingsVC
    
    let namenumber = PhrasesAndGreetings[indexPath.row]
    print(namenumber)
    vc?.image = UIImage(named: PhrasesAndGreetings[indexPath.row])!
    vc?.name = PhrasesAndGreetings[indexPath.row]
    self.navigationController?.pushViewController(vc!, animated: true)
    
    

  }
}
