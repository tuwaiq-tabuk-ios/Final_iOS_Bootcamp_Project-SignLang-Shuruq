//
//  FSCollectionReference.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 14/06/1443 AH.
//

import Foundation
import FirebaseFirestore

enum FSCollectionReference: String {
  
  case student
  case Teacher
  case Appointments
}

func getFSCollectionReference(_ collectionReference: FSCollectionReference ) -> CollectionReference {
return Firestore.firestore()
    .collection(collectionReference.rawValue)
}
