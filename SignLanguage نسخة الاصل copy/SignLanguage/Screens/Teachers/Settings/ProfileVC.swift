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
  
  let db = Firestore.firestore()
  
  
  @IBOutlet weak var avatarImageView: UIImageView!
  @IBOutlet weak var fullnameTF: UITextField!
  @IBOutlet weak var EmailTF: UITextField!
  @IBOutlet weak var phoneNumberTF: UITextField!
  @IBOutlet weak var userNameTF: UITextField!
  
  var fullName = "fullName"
  var email = "nil"
  var phonenumber = "phoneNumber"
  var username = "User name"
  var image = "image"
  
  var avatar = UIImage()
  let storage = Storage.storage()
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    overrideUserInterfaceStyle = .light

    
    // Do any additional setup after loading the view.
    avatarImageView.layer.masksToBounds = false
    avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
    avatarImageView.clipsToBounds = true
    avatarImageView.tintColor = .systemGray5
    
    loadImage()
    setDefaultAvatar()
    setupContextMenu()
    
    
    let user = Auth.auth().currentUser
    print("\n\n\n****** THE CURRENT USER ID:: \(String(describing: user?.uid))")
    
    if let currentUser = user {
      db.collection("Teacher").document(currentUser.uid).getDocument { doc, err in
        if err != nil {
          print("\n\n\n**** AN ERROR OCUURED:: \(String(describing: err))")
        } else {
          let data = doc!.data()!
          print("\n\n\n****** THE DATA::\(data)")
          
          
          self.email = (user?.email)!
          self.EmailTF.text = self.email
          
          self.fullName = data["fullName"] as! String
          self.fullnameTF.text = self.fullName
          
          
          self.phonenumber = data["phonenumber"] as! String
          self.phoneNumberTF.text = self.phonenumber
          
          self.username = data["User name"] as! String
          self.userNameTF.text = self.username
          
          
        }
      }
    }
    
  }
  
  @IBAction func sendProfile(_ sender: Any) {
    
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
                                                                                "phonenumber":self.phonenumber,
                                                                                "User name":self.username ,"image":image])  {  err in
      
      if let  err1 = err {
        print("Error updating document: \(err1)")
      } else {
        print("Document successfully updated")
      }
    }
  }
  
  
  private func setupContextMenu() {
    let interaction = UIContextMenuInteraction(delegate: self)
    avatarImageView.isUserInteractionEnabled = true
    avatarImageView.addInteraction(interaction)
  }
  
  
  private func selectAvatar(){
    let imagePicker = UIImagePickerController()
    imagePicker.allowsEditing = true
    imagePicker.delegate = self
    present(imagePicker, animated: true, completion: nil)
  }
  
  
  private func setDefaultAvatar() {
    avatarImageView.image = UIImage(named: "User Circle")
  }
  
  
  func loadImage() {
    let user = Auth.auth().currentUser
    guard let  currentUser  = user  else{return}
    let pathReference = storage.reference(withPath: "profile image/\(currentUser.uid).png")
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

extension ProfileVC : UIContextMenuInteractionDelegate {
  
  func contextMenuInteraction(_ interaction: UIContextMenuInteraction,
                              previewForHighlightingMenuWithConfiguration configuration: UIContextMenuConfiguration) ->
  UITargetedPreview? {
    let params = UIPreviewParameters()
    params.backgroundColor = .clear
    let preview = UITargetedPreview(view: avatarImageView, parameters: params)
    return preview
  }
  
  func contextMenuInteraction(_ interaction: UIContextMenuInteraction, configurationForMenuAtLocation location: CGPoint) -> UIContextMenuConfiguration? {
    
    guard interaction.view === avatarImageView else { return nil }
    
    return UIContextMenuConfiguration(identifier: nil, previewProvider: nil) { (suggestedActions) -> UIMenu? in
      let chooseAvatar = UIAction(title: "Choose Avatar", image: UIImage(systemName: "pencil"), identifier:
                                    nil) { _ in
        self.selectAvatar()
      }
      
      let removeAvatar = UIAction(title: "Remove", image: UIImage(systemName: "trash"), identifier: nil,
                                  attributes: [.destructive]) { _ in
        self.setDefaultAvatar()
      }
      return UIMenu(title: "Avatar", image: nil, identifier: nil, options: [], children: [
        chooseAvatar,removeAvatar
      ])
    }
  }
  
}

extension ProfileVC :UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
  
  private func imagePickerControllerDidCancel(_picker:UIImagePickerController) {
    dismiss(animated: true, completion: nil)
  }
  func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
    if let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage {
      avatarImageView.image = image
    }
    dismiss(animated: true , completion: nil)
  }
}
