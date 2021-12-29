//
//  StudentCVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 24/05/1443 AH.
//

// letters

//import UIKit
//
//
//class StudentCVC: UICollectionViewController {
//  
//  let name = [ "أ", "ب" , "ت", " ث", "ج" , "ح" , "خ" , "د" , "ذ" ,"ر" , "ز" , "س" , "ش" , "ص" , "ض" , "ع"  , "غ" , "ف" , "ق"
//               , "ك" , "ل" , "م" , "ن" , "و" , "ي"]
//  
//  @IBOutlet weak var CellcollectionView: UICollectionView!
//  
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//    }
//    
//  
//
//    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
//        // #warning Incomplete implementation, return the number of items
//      return name.count
//    }
//
//    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
//     
//      let cell = CellcollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? LettersView
//      
//      cell?.nameLabel.text = name[indexPath.row]
//      
//      return cell!
//      
//    }
//
//  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
// //   print("Selected letters :\(dataSource[indexPath.row])")
//    
////    let storyboard = UIStoryboard(name: "Main", bundle: nil)
////    let controller = storyboard.instantiateViewController(withIdentifier: "LettersViewController") as! LettersViewController
////    controller.image = dataSource[indexPath.row].imageName
////    controller.name = dataSource[indexPath.row].nameLabel
////
//    
//    
// //   self.navigationController?.pushViewController(controller, animated: true)
//    
//    
//  }
//  
//  
//  
////    func getName() -> String {
////      return dataSource[letterNumber].nameLabel
////      
////    }
////    func getImage() -> UIImage {
////      return dataSource[letterNumber].imageName
////    }
////  func nextLetter() -> Bool{
////    
////    if (letterNumber + 1 <  dataSource.count) {
////      letterNumber += 1
////      return true
////    } else {
////      return false
////    }
////  }
//
//}
//
