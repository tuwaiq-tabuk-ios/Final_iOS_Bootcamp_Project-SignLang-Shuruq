//
//  Teacher.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 30/05/1443 AH.
//

import UIKit

struct Teacher {
  
  var firstname: String
  var lastname: String
  var age : Int
  var info : String
  var exper: Int
  var email: String
  var requestDate: [DateTime]
  var reservationDate: [DateTime]
  var images: UIImage?
  var phoneNumber: String
  var userName: String
  
}

let array: [Teacher] = [
  Teacher(firstname: "مصطفى ",
          lastname: "احمد",
          age: 27,
          info: "",
          exper: 12,
          email: "email",
          requestDate:[
    DateTime(date: "2021-12-26", time: [
      "1:00م - 3:00م"
      ,"5:00م - 7:00م"
      ,"8:00م - 10:00م"
    ]),
    
    DateTime(date: "2021-12-27", time: [
      "2:00م - 4:00م"
      ,"6:00م - 8:00م"
      ,"9:00م - 11:00م"
    ]),
    
    DateTime(date: "2021-12-30", time: [
      "9:00ص - 11:00ص"
      ,"12:00م - 2:00م"
      ,"6:00م - 8:00م"
    ]),
   ], reservationDate:[
    DateTime(date: "2021-12-26", time: [
      "1:00م - 3:00م"
      ,"5:00م - 7:00م"
      ,"8:00م - 10:00م"
    ]),
    
    DateTime(date: "2021-12-27", time: [
      "2:00م - 4:00م"
      ,"6:00م - 8:00م"
      ,"9:00م - 11:00م"
    ]),
    
    DateTime(date: "2021-12-30", time: [
      "9:00ص - 11:00ص"
      ,"12:00م - 2:00م"
      ,"6:00م - 8:00م"
    ]),
   ],
          images: UIImage(named: "person.crop.circle.fill"), phoneNumber: "050000034", userName: "Mustafa20" ),
  
  Teacher(firstname: "آيه",
          lastname: "عبدالصمد",
          age: 30,
          info:"",
          exper: 25,
          email: "email",
          requestDate: [
    DateTime(date: "2021-12-19", time: [
      "1:00م - 3:00م"
      ,"5:00م - 7:00م"
      ,"8:00م - 10:00م"
    ]),
    
    DateTime(date: "2021-12-20", time: [
      "2:00م - 4:00م"
      ,"6:00م - 8:00م"
      ,"9:00م - 11:00م"
    ]),
    
    DateTime(date: "2021-12-23", time: [
      "9:00ص - 11:00ص"
      ,"12:00م - 2:00م"
      ,"6:00م - 8:00م"
    ]),
   ], reservationDate: [
    DateTime(date: "2021-12-16", time: [
      "1:00م - 3:00م"
      ,"5:00م - 7:00م"
      ,"8:00م - 10:00م"
    ]),
    
    DateTime(date: "2021-12-17", time: [
      "2:00م - 4:00م"
      ,"6:00م - 8:00م"
      ,"9:00م - 11:00م"
    ]),
    
    DateTime(date: "2021-12-18", time: [
      "9:00ص - 11:00ص"
      ,"12:00م - 2:00م"
      ,"6:00م - 8:00م"
    ]),
   ], images: UIImage(named: "person.crop.circle.fill"), phoneNumber: "059904502", userName: "Ayah530"),
  
  
           Teacher(firstname: "آدم",
                   lastname: "حسن",
                   age: 33,
                   info : "",
                   exper: 5,
                   email: "email",
                   requestDate:[
            DateTime(date: "2021-12-16", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-17", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-18", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
          reservationDate:[
            DateTime(date: "2021-12-19", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-20", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-23", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ], images: UIImage(named: "person.crop.circle.fill"),
                   phoneNumber: "050002134",
                   userName: "Adam2030"),
  
  
  Teacher(firstname: "سماح",
          lastname: "نوح",
          age: 35,
          info:"",
          exper: 30,
          email: "email",
          requestDate: [
            DateTime(date: "2021-12-16", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-17", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-18", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),
           ],
          reservationDate:[
            DateTime(date: "2021-12-16", time: [
              "1:00م - 3:00م"
              ,"5:00م - 7:00م"
              ,"8:00م - 10:00م"
            ]),
            
            DateTime(date: "2021-12-17", time: [
              "2:00م - 4:00م"
              ,"6:00م - 8:00م"
              ,"9:00م - 11:00م"
            ]),
            
            DateTime(date: "2021-12-18", time: [
              "9:00ص - 11:00ص"
              ,"12:00م - 2:00م"
              ,"6:00م - 8:00م"
            ]),],
          images: UIImage(named: "person.crop.circle.fill"),
          phoneNumber: "056909999",
          userName: "samh40")]
  
