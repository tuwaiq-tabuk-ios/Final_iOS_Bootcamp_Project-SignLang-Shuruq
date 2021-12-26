//
//  ProfileTableViewController.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 21/05/1443 AH.
//

import UIKit

class ProfileTableViewController: UITableViewController {

  let items: [Item] = [
  Item(name: "Account", description: "Description item 0"),
  Item(name: "Password", description: "Description item 1"),
  Item(name: "Phone number", description: "Description item 2"), Item(name: "Language", description: "Description item 3"),
  Item(name: "Username", description: "Description item 3")
  ]
  
  var currentDescription: String = ""
  
  @IBOutlet weak var avatarImageView: UIImageView!
  
  override func viewDidLoad() {
        super.viewDidLoad()

    avatarImageView.layer.borderWidth = 1
    avatarImageView.layer.masksToBounds = false
    avatarImageView.layer.borderColor = UIColor.black.cgColor
    avatarImageView.layer.cornerRadius = avatarImageView.frame.height/2
    avatarImageView.clipsToBounds = true
    avatarImageView.tintColor = .systemGray5

setDefaultAvatar()
setupContextMenu()
    }

    // MARK: - Table view data source

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
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
      return items.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reusable_cell", for: indexPath)

        // Configure the cell...
      cell.textLabel?.text = items[indexPath.row].name
       return cell
    }
    

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    currentDescription = items[indexPath.row].description
    performSegue(withIdentifier: "show_detail", sender: nil)
  }
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
    if let destinationVC = segue.destination as? DetailVC {
      destinationVC.descriptionText = currentDescription
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
