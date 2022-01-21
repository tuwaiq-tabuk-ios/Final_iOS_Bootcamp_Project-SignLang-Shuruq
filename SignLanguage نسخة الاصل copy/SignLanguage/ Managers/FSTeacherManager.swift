//
//  FSUserManager.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 14/06/1443 AH.
//

import Foundation
import Firebase

class FSTeacherManager {
  
  static let shared = FSTeacherManager()
  
  private init() {}
  
  // MARK: - ProPerties

  private var email: String = ""
  private var pasword: String = ""
  private var fullName: String = ""
  private var phoneNumber: String = ""
  private var userName: String = ""
  
  // MARK: - Register
  
  func signUpUserWith(
    email: String,
    password: String,
    fullName: String,
    phoneNumber: String,
    userName: String,
    
    completion: @escaping (_ error: Error?) -> Void
  ) {
    self.email = email
    self.pasword = password
    self.fullName = fullName
    self.phoneNumber = phoneNumber
    self.userName = userName
    
    Auth
      .auth()
      .createUser(withEmail: email, password: password) { (authDataResult, error) in
        completion(error)
        
        let id = authDataResult?.user.uid
        
        if error != nil {
          print("DEBUG: Error: \(String(describing:error?.localizedDescription))")
          completion(error)
        } else {
          getFSCollectionReference(.Teacher).document(authDataResult!.user.uid).setData( ["fullName":fullName,
                                                                                          "email":email,
                                                                                          "phoneNumber":phoneNumber,"userName":userName,"uid": id! ,"type":"Teacher"]) { (error) in
            if error != nil {
              completion(error)
            }
            
          }
        }
        
      }
  }
  
}
