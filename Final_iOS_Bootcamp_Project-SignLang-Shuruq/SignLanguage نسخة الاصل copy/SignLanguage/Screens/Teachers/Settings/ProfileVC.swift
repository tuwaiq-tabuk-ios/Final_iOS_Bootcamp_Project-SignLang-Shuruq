//
//  ProfileVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 30/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore
import FirebaseStorage


class ProfileVC: UIViewController {
  
  
  // MARK: - IBOutlet
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var fullnameTF: UITextField!
  @IBOutlet weak var EmailTF: UITextField!
  @IBOutlet weak var phoneNumberTF: UITextField!
  @IBOutlet weak var userNameTF: UITextField!
  
  
  //MARK: - Properties
  
  
  let db = Firestore.firestore()
  var fullName = "fullName"
  var email = "nil"
  var phonenumber = "phoneNumber"
  var username = "User name"
  var avatar = UIImage()
  let storages = Storage.storage()
  let storage = Storage.storage().reference()
  
  let user = Auth.auth().currentUser
  
  //  MARK: - View controller Life Cycle
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light
    
    avatarImageView.layer.masksToBounds = false
    avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
    avatarImageView.clipsToBounds = true
    avatarImageView.tintColor = .systemGray5
    
    loadImage()
  
    let user = Auth.auth().currentUser
    print("\n\n\n****** THE CURRENT USER ID:: \(String(describing: user?.uid))")
    
    if let currentUser = user {
      
      db.collection("Teacher").document(currentUser.uid).getDocument { doc, err in
        if err != nil {
          print("\n\n\n**** AN ERROR OCUURED:: \(String(describing: err))")
        } else {
          let data = doc!.data()!
          print("\n\n\n****** THE DATA::\(data)")
          
          print("****************** user uid : \(String(describing: user?.uid))")
          
          
          self.email = (user?.email)!
          self.EmailTF.text = self.email
          
          self.fullName = data["fullName"] as! String
          self.fullnameTF.text = self.fullName
          
          print("DEBUG: ************* Full Name : \(self.fullName)")
          
          
          self.phonenumber = data["phoneNumber"] as! String
          self.phoneNumberTF.text = self.phonenumber
          print("DEBUG: ************* phonenumber : \(self.phonenumber)")
          
          
          self.username = data["userName"] as! String
          self.userNameTF.text = self.username
          print("DEBUG: ************* username : \(self.username)")
          
        }
      }
    }
  }
  
  // MARK: - IBAction
  
  
  @IBAction func sendProfile(_ sender: UIButton) {
    
    let dataInfo:DocumentReference? = nil
    
    Auth.auth().currentUser?.updateEmail(to: EmailTF.text!) { [self] error in
      if error == nil{
        let washingtonRef = db.collection("Teacher").document(Auth.auth().currentUser!.uid)
        washingtonRef.updateData([
          "email": EmailTF.text!
        ]) { err in
          if let err = err {
            print("Error updating document: \(err)")
          } else {
            print("Document successfully updated")
          }
        }
        
      }
    }
    
    self.fullName = self.fullnameTF.text!
    self.phonenumber = self.phoneNumberTF.text!
    self.username = self.userNameTF.text!
    self.avatar = self.avatarImageView.image!
    
    db.collection("Teacher").document(Auth.auth().currentUser!.uid).updateData(["fullName" :self.fullName,
                                                                                "phoneNumber":self.phonenumber,
                                                                                "userName":self.username]) {  err in
      
      if let err = err {
        print(err)
      }
      
      else {
        guard let imagData = self.avatarImageView?.image?.pngData() else {
          return
        }
        
        _ = dataInfo?.documentID
        
        self.storage.child("imagesAD/\(String(describing: self.avatarImageView)).png").putData(imagData,
                                                                                               metadata: nil,
                                                                                               completion: { _, error in
          
          guard error == nil else {
            print ("Fieled")
            return
          }
          
          
        })
      }
    }
  }
  
  
  @IBAction func addphotoButton(_ sender: UIButton) {
    presentPhotoActionSheet()
    
  }
  
  // MARK: - Methods
  
  func loadImage() {
    let user = Auth.auth().currentUser
    guard user != nil  else{return}
    let pathReference = storages.reference(withPath: "imagesAD/\(String(describing: avatarImageView)).png")
    pathReference.getData(maxSize: 1000 * 1024 * 1024) { data, error in
      if let error = error {
        // Uh-oh, an error occurred!
        print(error)
      } else {
        // Data for "images/island.jpg" is returned
        let image = UIImage(data: data!)
        self.avatarImageView.image = image
      }
    }
  }
  
}


extension ProfileVC :UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
  
  func presentPhotoActionSheet(){
    
    let actionSheet = UIAlertController(
      title: "Advertising Picture",
      message: "How would you like to select a picture",
      preferredStyle: .actionSheet)
    actionSheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
    actionSheet.addAction(UIAlertAction(title: "Take Photo", style: .default, handler: {[weak self] _ in
      self?.presenCamera()
    } ))
    actionSheet.addAction(UIAlertAction(title: "Chose Photo", style: .default, handler: {[weak self ] _ in
      self?.presentPhotoPicker()
    }))
    present(actionSheet , animated: true)
  }
  
  func presenCamera (){
    let addImge = UIImagePickerController()
    addImge.sourceType = .camera
    addImge.delegate = self
    addImge.allowsEditing = true
    present(addImge, animated: true)
  }
  
  
  func presentPhotoPicker(){
    let addImge = UIImagePickerController()
    addImge.sourceType = .photoLibrary
    addImge.delegate = self
    addImge.allowsEditing = true
    present(addImge, animated: true)
  }
  
  
  func imagePickerController(_ picker: UIImagePickerController,
                             didFinishPickingMediaWithInfo info:
                             [UIImagePickerController.InfoKey : Any]) {
    
    picker.dismiss(animated: true, completion: nil)
    guard let selectedImage =
            info[UIImagePickerController.InfoKey.editedImage] as? UIImage else {
              return
            }
    self.avatarImageView.image  = selectedImage
  }
  func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
    picker.dismiss(animated: true, completion: nil)
  }
}


