//
//  ProfileTableViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 21/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class ProfileTableViewController: UIViewController {
  
  @IBOutlet weak var avatarImageView: AvatarImageView!
 
  @IBOutlet weak var nameLabel: UITextField!
  @IBOutlet weak var emailLabel: UITextField!
  @IBOutlet weak var password: UITextField!
  @IBOutlet weak var PhoneLabel: UITextField!
  @IBOutlet weak var userName: UITextField!
  
  
  let db = Firestore.firestore()
  override func viewDidLoad() {
        super.viewDidLoad()

   avatarImageView.layer.masksToBounds = false
   avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
    avatarImageView.clipsToBounds = true
    avatarImageView.tintColor = .systemGray5

setDefaultAvatar()
setupContextMenu()
    readUsers()

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
    
  func readUsers(){
    if  let user = Auth.auth().currentUser?.uid{
      let docRef = db.collection("Teacher").document(user)
     
      docRef.getDocument { (document, error) in
        if let document = document, document.exists {
          _ = document.data().map(String.init(describing:)) ?? "nil"
          self.nameLabel.text = document.data()?["First Name"] as? String
          self.emailLabel.text = document.data()?["Email"] as? String
          self.PhoneLabel.text = document.data()?["phoneNumber"] as? String
          self.password.text = document.data()?["Password"] as? String
          self.userName.text = document.data()?["UserName"] as? String
}
  }
}

  }
}

extension ProfileTableViewController : UIContextMenuInteractionDelegate {
  
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

  extension ProfileTableViewController:UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
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
