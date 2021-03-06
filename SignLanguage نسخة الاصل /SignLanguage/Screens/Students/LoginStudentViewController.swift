//
//  LoginStudentViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 15/05/1443 AH.
//

import UIKit
import FirebaseAuth

class LoginStudentViewController: UIViewController {
  
  // MARK: - IBOutlet

  @IBOutlet weak var emailTextField: UITextField!
  @IBOutlet weak var passwordTextField: UITextField!
  @IBOutlet weak var loginButton: UIButton!
  @IBOutlet weak var errorLabel: UILabel!
  
  //  MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    setUpElements()

  }
  
  // MARK: - IBAction

  @IBAction func loginTapped(_ sender: Any){
    
  // TODO:- Validate Text Fields
    
   // Create of the text field
    let email = emailTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
  let password = passwordTextField.text!.trimmingCharacters(in: .whitespacesAndNewlines)
  
  // Signing in the user
    
  Auth.auth().signIn(withEmail: email, password: password) { (result, error) in
    
    if error != nil {
      // Couldn't sign in
      self.errorLabel.text = error!.localizedDescription
      self.errorLabel.alpha = 1
    }
    else {
      
      let homeViewController = self.storyboard?.instantiateViewController(identifier: K.Storyboard.homeViewController) as? TabBarViewController
      
      self.view.window?.rootViewController = homeViewController
      self.view.window?.makeKeyAndVisible()
  }
  }
}
  
  // MARK: - Methods
  
  func setUpElements() {
    
    // Hide the error label
    errorLabel.alpha = 0
    
    // Style the elements
    Utilities.styleTextField(emailTextField)
    Utilities.styleTextField(passwordTextField)
    Utilities.styleFilledButton(loginButton)
    
  }
}

