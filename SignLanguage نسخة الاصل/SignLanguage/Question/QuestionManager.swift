//
//  QuestionManager.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 10/05/1443 AH.
//

import Foundation
import UIKit
import AVFoundation

class QuizManager {
  
  var player: AVAudioPlayer?
  var playerErrors : AVAudioPlayer?
  
  private var questionNumber = 0
  private var score = 0
  
  var quiz = [Question]()
  
  init() { quiz.append(
    Question(image:"The", question: "what the mean picture ?",
             answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
             correctAnswer:"Everest"))
    
    quiz.append(
      Question(image:"T", question: "what the mean picture ?",
               answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
               correctAnswer:"Everest"))
    
    quiz.append(
      Question(image:"Sh", question: "what the mean picture ?",
               answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
               correctAnswer:"Everest"))
    
    quiz.append(
      Question(image:"D", question: "what the mean picture ?",
               answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
               correctAnswer:"Everest"))
    
    quiz.append(
      Question(image:"The", question: "what the mean picture ?",
               answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
               correctAnswer:"Everest"))
  }
  
  
  func checkAnswer(_ userAnswer:String) -> Bool {
    
    print(userAnswer)
    print(quiz[questionNumber].correctAnswer)
    
    if userAnswer == quiz[questionNumber].correctAnswer {
      score += 5
      return true
    } else {
      score -= 10
      return false
    }
  }
  
  
  func getScore() -> Int {
    return score
  }
  
  
  func getQuestion() -> String {
    quiz[questionNumber].question
  }
  
  
  func getChoices() -> [String] {
    
    return quiz[questionNumber].answers
  }
  
  
  func getProgress() -> Float {
    Float (questionNumber + 1 ) / Float(quiz.count)
  }
  
  
 func nextQuestion() -> Bool{
    
    if (questionNumber + 1 <  quiz.count) {
      questionNumber += 1
      return true
      
    } else {
      return false
    }
  }
  
  
 func hasUserGoodScore() -> Bool {
    
    let maxScore = quiz.count * 5
    
    let reqScore = Double(maxScore) * 0.7
    
    return Double(score) >= reqScore ? true : false
    
  }
  
  
 func startGame(){
    score = 0
    questionNumber = 0
  }
  
  
 func playSound() {
    
    guard let url = Bundle.main.url(forResource: "clapping",
                                    withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      /* The following line is required for the player to work on
       iOS 11. Change the file type accordingly*/
      
      player = try AVAudioPlayer(contentsOf: url,
                                 fileTypeHint: AVFileType.mp3.rawValue)
      
      guard let player = player else { return }
      
      player.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
  
  func stopSound(){
    player?.stop()
  }
  
  
 func playError() {
    
    guard let url = Bundle.main.url(forResource: "error",
                                    withExtension: "mp3") else { return }
    
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
      try AVAudioSession.sharedInstance().setActive(true)
      /* The following line is required for the player to work on
       iOS 11. Change the file type accordingly*/
      
      playerErrors = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
      
      guard playerErrors != nil else { return }
      
      playerErrors!.play()
      
    } catch let error {
      print(error.localizedDescription)
    }
  }
  
}
