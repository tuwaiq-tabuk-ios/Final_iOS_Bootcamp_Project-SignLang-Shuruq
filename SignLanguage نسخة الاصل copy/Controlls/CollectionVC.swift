//
//  CollectionVC.swift
//  prototype-Navigation-colloction"BushraO-Shrooq"
//
//  Created by Shuruq on 25/04/1443 AH.
//

import UIKit

//private let reuseIdentifier = "LabelCell"

private let reuseIdentifier = String(describing: LabelCell.self)

class CollectionVC: UICollectionViewController {
  
  let items: [Item] = [
     Item(name: "Zero", description: "Description item zero"),
     Item(name: "One", description: "Description item one"),
     Item(name: "Two", description: "Description item two"),
     Item(name: "Three", description: "Description item three"),
     Item(name: "Four", description: "Description item four"),
     Item(name: "Five", description: "Description item five"),
     Item(name: "Six", description: "Description item six"),
     Item(name: "Seven", description: "Description item seven")
   ]
  
  var currentItem: Item?

  
  var numberOfHorizontalCells = 4
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    print("#file - #function")
    print(" - reuseIdetifier: \(reuseIdentifier)")
    
    let nib = UINib(nibName: reuseIdentifier, bundle: nil)
    
    collectionView.register(nib,
                            forCellWithReuseIdentifier: reuseIdentifier)
    
    configureSize(numOfHorizontalCells: 4 , marginBetweenCells: 10)
    
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    currentItem = items[indexPath.row]
    performSegue(withIdentifier: "show_detail", sender: nil)
  }
  
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
//    if let destinationVC = segue.destination as? DetailVC {
//      destinationVC.item = currentItem
//     }
//  }
 
  }
  // MARK: UICollectionViewDataSource
  
  override func numberOfSections(in collectionView: UICollectionView) -> Int {
    // #warning Incomplete implementation, return the number of sections
    return 1
  }
  
  
  override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    
    return items.count
    
  }
  
  override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    
    let cell
          = collectionView
              .dequeueReusableCell(withReuseIdentifier: reuseIdentifier,
                                   for: indexPath)
         
        if let labelCell = cell as? LabelCell {
          labelCell.titleLabel.text = items[indexPath.row].name
        }
         
        return cell
      }
     
  
  }

 

extension CollectionVC: UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    
    if let layout = collectionViewLayout as? UICollectionViewFlowLayout {
      return layout.itemSize
    }else{
      return .zero
      
      //CGSize(width: 0, height: 0)
    }
    
    
  }
  
  private func configureSize(numOfHorizontalCells:CGFloat , marginBetweenCells:CGFloat) {
    
    print("\n\nCollectionVC - \(#function)")
    
    guard let layout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout
    else {
      return
      
    }
    print(" - numOfHorizontalCells: \(numOfHorizontalCells)")
    // *** Cell spacing ***
    print(" - marginBetweenCells: \(marginBetweenCells)")
    // We only want the spaces between cells, not the leading and trailing
    
    let totalMarginBetweenCells: CGFloat =
    marginBetweenCells * (numOfHorizontalCells - 1)
    
    print(" - totalMarginBetweenCells: \(totalMarginBetweenCells)")
    
    let marginPerCell: CGFloat =
    totalMarginBetweenCells / numOfHorizontalCells
    
    print(" - marginPerCell: \(marginPerCell)")
    // *** Cell size ***
     let frameWidth = collectionView.frame.width
    
   // let frameWidth: CGFloat = 400
    
    print(" - frameWidth: \(frameWidth)")
    
    let cellWidth = frameWidth / numOfHorizontalCells - marginPerCell
    
    let cellHeight = cellWidth
    layout.minimumLineSpacing = 0
    layout.minimumInteritemSpacing = 0
    layout.estimatedItemSize = .zero
    layout.itemSize = CGSize(width: cellWidth,
                             height: cellHeight)
    print(" - layout.itemSize: \(layout.itemSize)")
    
    layout.minimumLineSpacing = marginBetweenCells
    
    
  }
  
}

