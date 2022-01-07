//
//  ProfileStudentTableVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 22/05/1443 AH.
//

import UIKit
import Firebase
import FirebaseFirestore

class ProfileStudentVC: UIViewController {

  
  var currentDescription: String = ""
  
  @IBOutlet weak var avatarImageView: AvatarImageView!
  @IBOutlet weak var editeProfile: UIButton!
  @IBOutlet weak var editePassword: UIButton!
  @IBOutlet weak var signOut: UIButton!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    avatarImageView.layer.masksToBounds = false
    avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
     avatarImageView.clipsToBounds = true
     avatarImageView.tintColor = .systemGray5

 setDefaultAvatar()
 setupContextMenu()
    
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
  
  @IBAction func editeProfile(_ sender: Any) {
    
    let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
    let nextViewController = storyBoard.instantiateViewController(withIdentifier: "EditeProfile") as! EditeProfile
    self.present(nextViewController, animated:true, completion:nil)
  }
    
  
  @IBAction func editePassword(_ sender: Any) {
    
    let vc3 = storyboard?.instantiateViewController(withIdentifier: "EditePassword")
       
      
      if let viewController1 = vc3 {
        navigationController?.pushViewController(viewController1, animated: true)
          
        }
    
  }
  
  @IBAction func signOut(_ sender: Any) {
    
    let vc4 = storyboard?.instantiateViewController(withIdentifier: "MainVC")
        if let viewController12 = vc4 {
        navigationController?.pushViewController(viewController12, animated: true)
          let firebaseAuth = Auth.auth()
              do {
                try firebaseAuth.signOut()
                self.navigationController?.popToRootViewController(animated: true)
                print("signOut")
              } catch let signOutError as NSError {
                print("Error signing out: %@", signOutError)

        }
  }
    
  }
}


extension ProfileStudentVC : UIContextMenuInteractionDelegate {
  
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

  extension ProfileStudentVC:UIImagePickerControllerDelegate ,UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_picker:UIImagePickerController) {
      dismiss(animated: true, completion: nil)
    }
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
      if let image = (info[.editedImage] ?? info[.originalImage]) as? UIImage {
        avatarImageView.image = image
      }
      dismiss(animated: true , completion: nil)
    }
  }

