//
//  familyVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 25/05/1443 AH.
//

import UIKit

class WeekDays: UIViewController {

 let weeks = ["الاحد","الاثنين", "الثلاثاء", "الاربعاء", "الخميس", "الجمعة", "السبت"]
  
  
  
  @IBOutlet weak var tableView: UITableView!
  
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

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
