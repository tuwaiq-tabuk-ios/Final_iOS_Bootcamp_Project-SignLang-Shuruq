//
//  familyVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 25/05/1443 AH.
//

import UIKit

class WeekDays: UIViewController {

 let weeks = ["الاحد","الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"]
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var tableView: UITableView!
  
  //  MARK: - View controller Life Cycle

  
    override func viewDidLoad() {
        super.viewDidLoad()

      overrideUserInterfaceStyle = .light

        // Do any additional setup after loading the view.
    }
  
}

extension WeekDays : UITableViewDelegate , UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return weeks.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Celled", for: indexPath) as? CellTableViewCell
    cell?.nameLabel.text = weeks[indexPath.row]
    return cell!
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let vc = storyboard?.instantiateViewController(withIdentifier: "DetailWeekdaysVC" ) as? DetailWeekdaysVC
    
    vc?.image = UIImage(named: weeks[indexPath.row])!
    vc?.name = weeks[indexPath.row]
    self.navigationController?.pushViewController(vc!, animated: true)
    
    

  }
}
