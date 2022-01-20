//
//  Utilities.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 15/05/1443 AH.
//

import Foundation
import UIKit

class Utilities {
  
  static func styleTextField(_ textfield:UITextField) {
    
    // Create the bottom line
    let bottomLine = CALayer()
    
    bottomLine.frame = CGRect(x: 0, y: textfield.frame.height - 2, width: textfield.frame.width, height: 2)
    
    bottomLine.backgroundColor = UIColor(named: "purples")?.cgColor
    
    // Remove border on text field
    textfield.borderStyle = .none
    
    // Add the line to the text field
    textfield.layer.addSublayer(bottomLine)
    
  }
  
  static func styleFilledButton(_ button:UIButton) {
    
    // Filled rounded corner style
    button.backgroundColor = UIColor.init(named: "purples")
    
    //.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
    button.layer.cornerRadius = 25.0
    button.tintColor = UIColor.white
  }
  
  
  static func styleHollowButton(_ button:UIButton) {
    
    // Hollow rounded corner style
    button.layer.borderWidth = 2
    button.layer.borderColor = UIColor.black.cgColor
    button.layer.cornerRadius = 25.0
    button.tintColor = UIColor.black
  }
  
  
  static func isPasswordValid(_ password : String) -> Bool {
    
    let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[a-z])(?=.*[$@$#!%*?&_])[A-Za-z\\d$@$#!%*?&_]{8,}")
    return passwordTest.evaluate(with: password)
  }
  
}
