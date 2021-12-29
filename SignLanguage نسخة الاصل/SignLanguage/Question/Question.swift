//
//  Question.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 10/05/1443 AH.
//

import Foundation
import UIKit

class Question {

  let questionImage :UIImage
  let question: String
  let answers: [String]
  let correctAnswer :String

  init(image :UIImage ,question:String ,answers:[String] ,correctAnswer:String) {
    self.questionImage = image
    self.question = question
    self.answers = answers
    self.correctAnswer = correctAnswer
    
    
  }
}
