//
//  SignUpStudentViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 15/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpStudentViewController: UIViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var fullNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: CMTextField!
  @IBOutlet weak var confirmPasswordTextField: CMTextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  
  // MARK: - Properties
  
  var fullName = false
  var email = false
  var password = true
  var confirmPassword = true
  
  //  MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
    overrideUserInterfaceStyle = .light
    errorLabel.isHidden = true
    
  }
  
  // MARK: - IBAction
  
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    signUp()
    
  }
  
  private func signUp() {
    
    guard let email = emailTextField.text,
          email.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the email"
            return
          }
    
    guard let password = passwordTextField.text,
          password.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Enter the password"
            return
          }
    
    guard let confirmPassword = confirmPasswordTextField.text,
          confirmPassword.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Enter the confirm Password"
            return
          }
    
    guard let fullName = fullNameTextField.text,
          fullName.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the first name"
            return
          }
    
    if password == confirmPassword {
      
      FSStudentManager.shared.signUpUserWith(email: email,
                                             password: password,
                                             confirmPassword: confirmPassword,
                                             fullName: fullName) { error in
        
        if error == nil {
          let storybord = UIStoryboard(name: "Main", bundle: nil)
          let vc = storybord.instantiateViewController(withIdentifier: K.Storyboard.homeViewController)
          
          vc.modalPresentationStyle = .overFullScreen
          
          self.present(vc, animated: true)
        } else {
          self.errorLabel.isHidden = false
          self.errorLabel.text = error?.localizedDescription
        }
      }
    } else {
      self.errorLabel.isHidden = false
      self.errorLabel.text = "Passwords don't match"
    }
  }
  
  
  // MARK: - Methods
  
  func setUpElements() {
    
    // Style the elements
    Utilities.styleTextField(fullNameTextField)
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleTextField(confirmPasswordTextField)
    Utilities.styleFilledButton(signUpButton)
  }
  
  
}


