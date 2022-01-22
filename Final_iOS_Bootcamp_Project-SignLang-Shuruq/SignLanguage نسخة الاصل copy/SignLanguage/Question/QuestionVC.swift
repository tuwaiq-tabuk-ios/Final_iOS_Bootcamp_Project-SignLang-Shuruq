//
//  QuestionVC.swift
//  SignLanguage
//
//  Created by Shorouq AlAnzi on 10/05/1443 AH.
//

import UIKit

class QuestionVC: UIViewController {
  

  // MARK: - ProPerties

  var quizManager = QuizManager()
  var timer:Timer = Timer()
  
  // MARK: - IBOutlet

  @IBOutlet weak var valueScoreLabel: UILabel!
  @IBOutlet weak var questionLabel: UILabel!
  @IBOutlet weak var questionImage: UIImageView!
  @IBOutlet weak var optionFirstButton: UIButton!
  @IBOutlet weak var optionSecondButton: UIButton!
  @IBOutlet weak var optionThirdButton: UIButton!
  @IBOutlet weak var optionFourthButton: UIButton!
  @IBOutlet weak var progressBar: UIProgressView!

  //  MARK: - View controller Life Cycle

  override func viewDidLoad() {
        super.viewDidLoad()

    overrideUserInterfaceStyle = .light

    configureButons()
    startGame()
    updateUI()
    }
  
  // MARK: - IBAction

  @IBAction func answerButtonPressed(_ sender: UIButton) {
    
    guard let userAnswer = sender.currentTitle else {
      print("ERROR: Button do not have the title property set in storyboard ")
      return
    }
      
  let check = quizManager.checkAnswer(userAnswer)
  
  if check {
    sender.backgroundColor = .systemGreen
  } else {
    sender.backgroundColor = .systemRed
  }
  
  
  if quizManager.nextQuestion() {
    timer = Timer.scheduledTimer(timeInterval: 0.8,
                                 target: self,
                                 selector: #selector(updateUI),
                                 userInfo: nil,
                                 repeats: false)
    
  } else {
    valueScoreLabel.text = "\(quizManager.getScore())"
    
    if quizManager.hasUserGoodScore(){
      showGoodScoreAlertMessage()
      quizManager.playSound()
    }else{
      showGameOverAlertMessage()
      quizManager.playError()
    }
  }
}

// MARK : - UI configure

func  configureButons() {
  
  optionFirstButton.layer.cornerRadius = 30
  optionFirstButton.layer.borderColor = #colorLiteral(red: 0.3568627451, green: 0.3019607843, blue: 0.8392156863, alpha: 1)
  optionFirstButton.layer.borderWidth = 3
  optionFirstButton.titleLabel?.adjustsFontSizeToFitWidth = true
  optionFirstButton.titleLabel?.minimumScaleFactor = 0.5
  
  
  optionSecondButton.layer.cornerRadius = 30
  optionSecondButton.layer.borderColor = #colorLiteral(red: 0.3568627451, green: 0.3019607843, blue: 0.8392156863, alpha: 1)
  optionSecondButton.layer.borderWidth = 3
  optionSecondButton.titleLabel?.adjustsFontSizeToFitWidth = true
  optionSecondButton.titleLabel?.minimumScaleFactor = 0.5
  
  optionThirdButton.layer.cornerRadius = 30
  optionThirdButton.layer.borderColor = #colorLiteral(red: 0.3568627451, green: 0.3019607843, blue: 0.8392156863, alpha: 1)
  optionThirdButton.layer.borderWidth = 3
  optionThirdButton.titleLabel?.adjustsFontSizeToFitWidth = true
  optionThirdButton.titleLabel?.minimumScaleFactor = 0.5
  
  optionFourthButton.layer.cornerRadius = 30
  optionFourthButton.layer.borderColor = #colorLiteral(red: 0.3568627451, green: 0.3019607843, blue: 0.8392156863, alpha: 1)
  optionFourthButton.layer.borderWidth = 3
  optionFourthButton.titleLabel?.adjustsFontSizeToFitWidth = true
  optionFourthButton.titleLabel?.minimumScaleFactor = 0.5
}

// MARK: - Methods 
  
  
func startGame(action: UIAlertAction! = nil){
  print(#function)
  quizManager.stopSound()
  quizManager.startGame()
  updateUI()
}


@objc func updateUI(){
  valueScoreLabel.text = String(quizManager.getScore())
  
  questionLabel.text = quizManager.getQuestion()
  questionImage.image = quizManager.getImage()
  
  optionFirstButton.backgroundColor = UIColor.clear
  optionSecondButton.backgroundColor = UIColor.clear
  optionThirdButton.backgroundColor = UIColor.clear
  optionFourthButton.backgroundColor = UIColor.clear
  
  
  optionFirstButton.setTitle(quizManager.getChoices()[0], for: .normal)
  optionSecondButton.setTitle(quizManager.getChoices()[1], for: .normal)
  optionThirdButton.setTitle(quizManager.getChoices()[2], for: .normal)
  optionFourthButton.setTitle(quizManager.getChoices()[3], for: .normal)
  
  
  progressBar.progress = quizManager.getProgress()
}


func showGameOverAlertMessage() {
  
  let ac = UIAlertController(title: "GAME OVER ",
                             message: "Your scores is \(quizManager.getScore())",
                             preferredStyle: .alert
  )
  
  ac.addAction(UIAlertAction(title: "Play again",
                             style: .default,
                             handler: startGame))
  present(ac, animated: true)
}


func showGoodScoreAlertMessage() {
  
  if quizManager.hasUserGoodScore() {
    let ac = UIAlertController(title: "Good Job",
                               message: "Your scores is \(quizManager.getScore())",
                               preferredStyle: .alert
    )
    
    ac.addAction(UIAlertAction(title: "Play again",
                               style: .default ,
                               handler: startGame))
    present(ac, animated: true)
  }
}

}
