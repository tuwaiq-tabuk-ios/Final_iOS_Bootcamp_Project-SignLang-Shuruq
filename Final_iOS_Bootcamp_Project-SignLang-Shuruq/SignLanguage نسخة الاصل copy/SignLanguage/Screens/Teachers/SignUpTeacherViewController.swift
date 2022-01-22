//
//  Sign UpViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 09/05/1443 AH.
//

import UIKit
import FirebaseAuth
import Firebase
import FirebaseFirestore

class SignUpTeacherViewController: UIViewController {
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var fullNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var phoneNumberTextField: UITextField!
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: CMTextField!
  @IBOutlet weak var confirmPassword: CMTextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
    super.viewDidLoad()
    
  //  errorLabel.isHidden = true
    setUpElements()
    overrideUserInterfaceStyle = .light
    
  }
  
  
  // MARK: - IBAction

  @IBAction func signUpTapped(_ sender: Any) {
    
    signUp()

  }
   // MARK: - Methods
  
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
      
      guard let confirmPassword = confirmPassword.text,
            confirmPassword.isEmpty == false else {
                errorLabel.isHidden = false
                errorLabel.text = "Enter the confirm Password"
                return
            }
    
    guard let fullName = fullNameTextField.text,
          fullName.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the full name"
            return
          }
    
    guard let phoneNumber = phoneNumberTextField.text,
          phoneNumber.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Enter the phone Number"
            return
          }
          
    guard let userName = userNameTextField.text,
          userName.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the user name"
            
            return
          }
    
      FSTeacherManager.shared.signUpUserWith(email: email,
                                             password: password,
                                             confirmPassword: confirmPassword,
                                             fullName: fullName, phoneNumber: phoneNumber,
                                             userName: userName) { error in
         
      if error == nil {
        // Navigation
        let storybord = UIStoryboard(name: "Main", bundle: nil)
        let vc = storybord.instantiateViewController(withIdentifier: K.Storyboard.teacherVCIdentifier)
        
        vc.modalPresentationStyle = .overFullScreen
        self.present(vc, animated: true)
        
      } else {
        self.errorLabel.isHidden = false
        self.errorLabel.text = error?.localizedDescription
      }
    }
  }
    
    //MARK: - Methods

  func setUpElements() {
    
    
    // Style the elements
    Utilities.styleTextField(fullNameTextField)
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(phoneNumberTextField)
    Utilities.styleTextField(userNameTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleTextField(confirmPassword)
    Utilities.styleFilledButton(signUpButton)
  }
}
