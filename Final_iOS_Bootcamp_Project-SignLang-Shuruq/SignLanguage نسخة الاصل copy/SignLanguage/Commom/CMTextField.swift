//
//  MainTF.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 21/05/1443 AH.
//

 import UIKit

@IBDesignable

final  class CMTextField: UITextField {
    
  
    // Provides left padding for images
    override func leftViewRect(forBounds bounds: CGRect) -> CGRect {
      let textRect = super.leftViewRect(forBounds: bounds)
    
        return textRect
    }

    override func rightViewRect(forBounds bounds: CGRect) -> CGRect {
            return CGRect(x: bounds.width - 30, y: 0, width: 20 , height: bounds.height)
        }

    
    
    var padding = UIEdgeInsets(top: 0, left: 10 , bottom: 0, right: 5)
    override public func textRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
       }
  
  
    override public func placeholderRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
       }
  
  
    override public func editingRect(forBounds bounds: CGRect) -> CGRect {
        return bounds.inset(by: padding)
       }
    
    
    
    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    
    @IBInspectable var withBorder: Bool = true  {
        didSet {
            updateView()
        }
    }


    @IBInspectable var color: UIColor = UIColor.lightGray {
        didSet {
            updateView()
        }
    }


    @IBInspectable var borderColor: UIColor? = nil {
        didSet {
            updateView()
        }
    }

  
    @IBInspectable var isPasswordTF:Bool = false {
        didSet{
            self.isSecureTextEntry = isPasswordTF
            setEyeView()
        }
    }
 
    
    func setEyeView(){

        if isPasswordTF {
            rightViewMode = UITextField.ViewMode.always

            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(systemName: "eye.fill")

            imageView.tintColor = color
            rightView = imageView
            let tap = UITapGestureRecognizer(target: self, action: #selector(self.updateTextFieldType(_:)))
            imageView.isUserInteractionEnabled = true
            imageView.addGestureRecognizer(tap)



        } else {
            rightViewMode = UITextField.ViewMode.never
            rightView = nil
        }

      let _:CGFloat = isPasswordTF ? 35:5

    }

  
            @objc func updateTextFieldType(_ sender: UITapGestureRecognizer? = nil) {
                // handling code
                isSecureTextEntry.toggle()
                if let sender = sender?.view as? UIImageView{
                    if isSecureTextEntry {
                        sender.image = UIImage(systemName: "eye.fill")
                    }else{
                        sender.image = UIImage(systemName: "eye.slash")

                    }
                }
            }
 
    
    func updateView() {
        if let image = leftImage {
            leftViewMode = UITextField.ViewMode.always

            let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 20, height: 20))
            imageView.contentMode = .scaleAspectFit
            imageView.image = image


            imageView.tintColor = color
            leftView = imageView

        } else {
            leftViewMode = UITextField.ViewMode.never
            leftView = nil

        }
      let _:CGFloat = isPasswordTF ? 35:5

        // Placeholder text color
        attributedPlaceholder = NSAttributedString(string: placeholder != nil ?  placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: color])


        layer.borderColor = borderColor != nil ? borderColor?.cgColor :  color.cgColor

    }

}


 
