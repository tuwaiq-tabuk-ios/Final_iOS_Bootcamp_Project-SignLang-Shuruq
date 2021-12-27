//
//  Question.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 10/05/1443 AH.
//

import Foundation
import UIKit

class Question {

  let questionImage :String
  let question: String
  let answers: [String]
  let correctAnswer :String

  init(image :String ,question:String ,answers:[String] ,correctAnswer:String) {
    questionImage = image
    self.question = question
    self.answers = answers
    self.correctAnswer = correctAnswer
    
    
  }
}
