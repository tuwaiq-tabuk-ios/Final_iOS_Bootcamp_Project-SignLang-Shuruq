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
  
  
  // MARK : - IBOutlet
  @IBOutlet weak var fullNameTextField: UITextField!
  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var phoneNumberTextField: UITextField!
  @IBOutlet weak var userNameTextField: UITextField!
  @IBOutlet weak var passwordTextField: MainTF!
  @IBOutlet weak var confirmPassword: MainTF!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  // view controller lifecycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    setUpElements()
    overrideUserInterfaceStyle = .light

  }
  
  
  func setUpElements() {
    
    // Hide the error label
    errorLabel.alpha = 0
    
    // Style the elements
    Utilities.styleTextField(fullNameTextField)
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(phoneNumberTextField)
    Utilities.styleTextField(userNameTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleTextField(confirmPassword)
    Utilities.styleFilledButton(signUpButton)
  }
  
  
  func validateFields() -> String? {
    
    // Check that all fields are filled in
    if fullNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        phoneNumberTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        userNameTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        emailTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        passwordTextField.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" ||
        confirmPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""
    {
      
      return "Please fill in all fields."
    }
    // Check if the password is secure
    let cleanedPassword = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
    
    if Utilities.isPasswordValid(cleanedPassword) == false {
      // Password isn't secure enough
      return "Please make sure your password is at least 8 characters, contains a special character and a number."
    }
    
    return nil
  }
  
  
  @IBAction func signUpTapped(_ sender: Any) {
    
    let error = validateFields()
    
    if error != nil {
      
      // There's something wrong with the fields, show error message
      showError(error!)
    }
    else {
      
      // Create cleaned versions of the data
      let fullName = fullNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let phoneNumber = phoneNumberTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let userName = userNameTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      _ = confirmPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
      
      // Create the user
      Auth.auth().createUser(withEmail: email, password: password) { (result, err) in
        
        // Check for errors
        if err != nil {
          
          // There was an error creating the user
          self.showError("Error creating user: \(String(describing: err?.localizedDescription))")
        }
        else {
          
          // User was created successfully, now store the first name and last name
          let db = Firestore.firestore()
          let id = result?.user.uid
          db.collection("Teacher").document(id!).setData(["fullName": fullName,
                                                          "phoneNumber": phoneNumber,
                                                          "User name": userName,
                                                          "email":email,
                                                          "uid": result!.user.uid ]) { (error) in
            
            if error != nil {
              // Show error message
              self.showError("Error saving user data")
            }
          }
          // Transition to the home screen
          self.transitionToHome()
        }
        
      }
    }
  }
  
  
  
  
  
  func showError(_ message:String) {
    
    errorLabel.text = message
    errorLabel.alpha = 1
  }
  
  
  func transitionToHome() {
    
    let teacherVC = self.storyboard?.instantiateViewController(identifier: K.Storyboard.teacherVCIdentifier) as? TabbarTeacher
    
    self.view.window?.rootViewController = teacherVC
    self.view.window?.makeKeyAndVisible()
  }
  
}
