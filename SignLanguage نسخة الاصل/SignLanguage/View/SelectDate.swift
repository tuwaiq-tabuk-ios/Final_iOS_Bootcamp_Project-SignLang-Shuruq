//
//  SelectDate.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 30/05/1443 AH.
//

import UIKit

class SelectDate: UIViewController {

  @IBOutlet weak var dateTF: UITextField!
  override func viewDidLoad() {
        super.viewDidLoad()

    let datePicker = UIDatePicker()
    datePicker.datePickerMode = .dateAndTime
    datePicker.addTarget(self, action: #selector(dataChange(datePicker:)), for: UIControl.Event.valueChanged)
    datePicker.frame.size = CGSize(width: 0, height: 300)
    datePicker.preferredDatePickerStyle = .wheels
   // datePicker.maximumDate = 
    
    
    dateTF.inputView = datePicker
    dateTF.text = formatDate(date: Date())

  
  }
    
  @objc func dataChange(datePicker: UIDatePicker) {
    dateTF.text = formatDate(date: datePicker.date)
  }


  func formatDate(date : Date) -> String {
    let formatter = DateFormatter()
    formatter.dateFormat = "MMM dd yyyy"
    
    return formatter.string(from: date)
  }
}
