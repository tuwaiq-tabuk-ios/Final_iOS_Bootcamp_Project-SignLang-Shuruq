//
//  FSStudentManger.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 14/06/1443 AH.
//


import Foundation
import Firebase

class FSStudentManager {
  
  static let shared = FSStudentManager()
  
  private init() {}
  
  private var email: String = ""
  private var pasword: String = ""
  private var fullName: String = ""
  
  // MARK: - Register
  func signUpUserWith(
    email: String,
    password: String,
    fullName: String,
    
    completion: @escaping (_ error: Error?) -> Void
  ) {
    self.email = email
    self.pasword = password
    self.fullName = fullName
    
    Auth
      .auth()
      .createUser(withEmail: email, password: password) { (authDataResult, error) in
        completion(error)
        
        if error != nil {
          print("DEBUG: Error: \(String(describing:error?.localizedDescription))")
          completion(error)
        } else {
          getFSCollectionReference(.Teacher).document(authDataResult!.user.uid).setData( ["fullName":fullName,"type":"student"]) { (error) in
            if error != nil {
              completion(error)
            }
            
          }
        }
        
      }
  }
  
}

