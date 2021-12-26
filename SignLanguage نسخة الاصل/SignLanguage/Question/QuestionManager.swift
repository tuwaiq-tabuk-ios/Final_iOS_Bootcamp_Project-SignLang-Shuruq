//
//  QuestionManager.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 10/05/1443 AH.
//

import Foundation
import UIKit
import AVFoundation

struct QuizManager {
  
  var player: AVAudioPlayer?
  var playerErrors : AVAudioPlayer?
  
  private var questionNumber = 0
  private var score = 0
  
  let quiz = [
    Question(questionImage: "The", question: "Which is the world's tallest peak?",
             answers: ["Klimanjaro", "Everest", "Jabal Sawda", "Montblanc"],
             correctAnswer:"Everest"),
    
    Question(questionImage: "N", question:  "Which is the Capital of Saudi Arabia?",
             answers: ["Riyadh", "Sydney", "Melbourne", "Australia does not have a capital"] ,
             correctAnswer: "Riyadh"),
    
    Question(questionImage: "T", question: "Where are the largest markets for dates in Saudi Arabia?" ,
             answers: ["Buraydah", "Okaz", "Onaizah", "Onaizah"],
             correctAnswer: "Buraydah"),
    
    Question(questionImage: "Sh", question: "Where is the Elephant Mountain in Saudi Arabia?",
             answers: ["Mecca", "Dammam", "Al Ula", "Abha"],
             correctAnswer: "Al Ula" ),
    
    Question(questionImage: "ضاء", question: "Where is the NEOM project in Saudi Arabia?",
             answers: ["West", "North", "East", "South"] ,
             correctAnswer: "North")]
  
  
  mutating func checkAnswer(_ userAnswer:String) -> Bool {
    
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
  
  
  mutating func nextQuestion() -> Bool{
    
    if (questionNumber + 1 <  quiz.count) {
      questionNumber += 1
      return true
      
    } else {
      return false
    }
  }
  
  
  mutating func hasUserGoodScore() -> Bool {
    
    let maxScore = quiz.count * 5
    
    let reqScore = Double(maxScore) * 0.7
    
    return Double(score) >= reqScore ? true : false
    
  }
  
  
  mutating func startGame(){
    score = 0
    questionNumber = 0
  }
  
  
  mutating func playSound() {
    
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
  
  
  mutating func playError() {
    
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
