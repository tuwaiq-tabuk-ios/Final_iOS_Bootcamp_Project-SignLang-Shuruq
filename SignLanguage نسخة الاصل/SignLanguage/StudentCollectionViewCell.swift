//
//  StudentCollectionViewCell.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 24/05/1443 AH.
//

// letters

import UIKit

class StudentCollectionViewCell: UICollectionViewCell {
  
  
  
  @IBOutlet private weak var lettersNameLabel: UILabel!
  
  func configure(with lettersName: String) {
    
    lettersNameLabel.text = lettersName
    print("*******\n\n\n the cell label = \(lettersNameLabel.text = lettersName)")
  }
}
