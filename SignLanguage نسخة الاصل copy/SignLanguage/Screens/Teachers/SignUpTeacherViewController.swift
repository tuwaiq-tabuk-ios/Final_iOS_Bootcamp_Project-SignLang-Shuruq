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
  @IBOutlet weak var passwordTextField: MainTF!
  @IBOutlet weak var confirmPassword: MainTF!
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
    
    guard let fullName = fullNameTextField.text,
          fullName.isEmpty == false else {
            errorLabel.isHidden = false
            errorLabel.text = "Fill in the full name"
            return
          }
    
    FSTeacherManager.shared.signUpUserWith(email: email,
                                        password: password,
                                        fullName: fullName) { error in
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

  func setUpElements() {
    
    // Hide the error label
  //  errorLabel.alpha = 0
    
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
