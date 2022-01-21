//
//  AppointmentsCell.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 07/06/1443 AH.
//

import UIKit

class AppointmentsCell: UITableViewCell {

  // MARK: - IBOutlet

  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var dateAndTime: UILabel!
  
  override func awakeFromNib() {         
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
