//
//  CellTableViewCell.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 24/05/1443 AH.
//

import UIKit

class CellTableViewCell: UITableViewCell {

  
  @IBOutlet weak var nameLabel: UILabel!
  
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
