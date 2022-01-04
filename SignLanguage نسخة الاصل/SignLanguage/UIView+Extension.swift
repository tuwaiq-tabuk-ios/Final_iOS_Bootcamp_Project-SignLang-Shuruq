//
//  UIView+Extension.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 23/05/1443 AH.
//

import Foundation

import UIKit
extension UIView {
    @IBInspectable var cornerRadius: CGFloat {
      get { return self.cornerRadius }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
