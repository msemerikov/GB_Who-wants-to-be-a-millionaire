//
//  GameViewController.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

protocol GameViewControllerDelegate: class {
    var totalQuestions: Int { get set }
    var percentCorrectAnswers: Observable<Int> { get set }
    var currentQuestion: Observable<Int> { get set }
    var isFiftyFifty: Bool { get set }
    var isPhoneAFriend: Bool { get set }
    var isAskTheAudience: Bool { get set }
    func correctAnswer()
    func endGame()
}

class GameViewController: UIViewController {
    weak var gameDelegate: GameViewControllerDelegate?
    private var questions = Game.shared.questions
    var questionsStrategy: OrderQuestionsStrategy?

    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet var answersButton: [UIButton]!
    @IBOutlet var hintsButton: [UIButton]!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var percentCorrectAnswersLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        gameDelegate = Game.shared.gameSession
        gameDelegate?.totalQuestions = questions.count
        chooseStrategy()
        configureLabels()
        setupBackgroundImage()
        configureButtons()
        configureView(with: questions[gameDelegate?.currentQuestion.value ?? 0])
    }
    
    func chooseStrategy() {
        switch Game.shared.orderQuestions {
        case .random:
            questionsStrategy = RandomQuestionsStrategy()
        case .sequentially:
            questionsStrategy = SequentiallyQuestionsStrategy()
        }
        questions = questionsStrategy?.chooseOrderOfQuestions(from: questions) ?? questions
    }
    
    func configureLabels() {
        gameDelegate?.percentCorrectAnswers.addObserver(self, options: [.new, .initial], closure: { [weak self] (percentage, _) in self?.percentCorrectAnswersLabel.text = "\(percentage)%" })
        gameDelegate?.currentQuestion.addObserver(self, options: [.new, .initial], closure: { [weak self] (question, _) in self?.questionNumberLabel.text = "\(question + 1)" })
    }
    
    func setupBackgroundImage() {
        let backgroundImageName = "background.png"
        guard let image =  UIImage(named: backgroundImageName) else {
            assertionFailure("Missing ​​\(backgroundImageName) asset")
            return
        }
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    private func configureButtons() {
        answersButton.forEach {
            $0.configure()
        }
        hintsButton.forEach {
            $0.configure()
        }
    }
    
    private func configureView(with question: Question) {
        questionLabel.text = question.question
        answersButton.forEach {
            $0.setTitle(question.answers[$0.tag], for: .normal)
            $0.isEnabled = true
            $0.alpha = 1
            $0.backgroundColor = .clear
        }
    }
    
    private func fiftyFifty() {
        guard let gameDelegate = gameDelegate else { return }
        gameDelegate.isFiftyFifty = false
        let indexCorrectAnswer = questions[gameDelegate.currentQuestion.value].rightAnswer - 1
        let arrayOfIndexes = Array(0..<questions[gameDelegate.currentQuestion.value].answers.count)
        let randomIndex = Int.random(in: 0..<(arrayOfIndexes.count - 1))
        var wrongIndexes = arrayOfIndexes.filter { $0 != indexCorrectAnswer }
        wrongIndexes.remove(at: randomIndex)
        _ = wrongIndexes.map {
            answersButton[$0].isEnabled = false
            answersButton[$0].alpha = 0
        }
    }
    
    private func phoneAFriend() {
        guard let gameDelegate = gameDelegate else { return }
        gameDelegate.isPhoneAFriend = false
        let indexCorrectAnswer = questions[gameDelegate.currentQuestion.value].rightAnswer - 1
        let firstRandom = Int.random(in: 0 ... (questions[gameDelegate.currentQuestion.value].answers.count - 1))
        let secondRandom = Int.random(in: 0 ... (questions[gameDelegate.currentQuestion.value].answers.count - 1))
        
        if firstRandom == indexCorrectAnswer {
            answersButton[firstRandom].backgroundColor = .orange
        } else {
            answersButton[secondRandom].backgroundColor = .orange
        }
    }
    
    private func phoneAFriendAfterFiftyFifty() {
        guard let gameDelegate = gameDelegate else { return }
        gameDelegate.isPhoneAFriend = false
        let indexCorrectAnswer = questions[gameDelegate.currentQuestion.value].rightAnswer - 1
        answersButton[indexCorrectAnswer].backgroundColor = .orange
    }
    
    private func askTheAudience() {
        guard let gameDelegate = gameDelegate else { return }
        gameDelegate.isAskTheAudience = false
        let indexCorrectAnswer = questions[gameDelegate.currentQuestion.value].rightAnswer - 1
        var percent = 80
        answersButton
            .filter { $0.tag != indexCorrectAnswer }
            .forEach {
                let answerPercent = Int.random(in: 0 ... percent)
                percent -= answerPercent
                $0.setTitle(($0.titleLabel?.text ?? "") + " - \(answerPercent) %", for: .normal) }
        answersButton[indexCorrectAnswer].setTitle((answersButton[indexCorrectAnswer].titleLabel?.text ?? "") + " - \(percent + 20) %", for: .normal)
    }
    
    private func askTheAudienceAfterFiftyFifty() {
        guard let gameDelegate = gameDelegate else { return }
        gameDelegate.isAskTheAudience = false
        let indexCorrectAnswer = questions[gameDelegate.currentQuestion.value].rightAnswer - 1
        let firstRandom = Int.random(in: 20 ... 100)
        let secondRandom = (100 - firstRandom)
        answersButton.forEach {
            $0.setTitle(($0.titleLabel?.text ?? "") + " - \(secondRandom) %", for: .normal)
        }
        answersButton[indexCorrectAnswer].setTitle((answersButton[indexCorrectAnswer].titleLabel?.text ?? "") + " - \(firstRandom) %", for: .normal)
    }
    
    @IBAction func answerButtonTapped(_ sender: UIButton) {
        guard let gameDelegate = gameDelegate else { return }
        if sender.tag != questions[gameDelegate.currentQuestion.value].rightAnswer - 1 {
            gameDelegate.endGame()
            let alert = Alert(question: "Ответ неверный, Вы проиграли",
                              acceptTitle: "Ок",
                              rejectTitle: nil)
            alert.present(in: self)
        } else if gameDelegate.currentQuestion.value < questions.count - 1 {
            gameDelegate.correctAnswer()
            configureView(with: questions[gameDelegate.currentQuestion.value])
        } else {
            gameDelegate.correctAnswer()
            gameDelegate.endGame()
            let alert = Alert(question: "Поздравляю! Вы ответили верно на все вопросы",
                              acceptTitle: "Ок",
                              rejectTitle: nil)
            alert.present(in: self)
        }
    }
    
    @IBAction func hintsButtonTapped(_ sender: UIButton) {
        hintsButton[sender.tag].isEnabled = false
        hintsButton[sender.tag].alpha = 0
        switch sender.tag {
        case 0:
            fiftyFifty()
        case 1:
            if gameDelegate!.isFiftyFifty {
                phoneAFriend()
            } else {
                phoneAFriendAfterFiftyFifty()
            }
        case 2:
            if gameDelegate!.isFiftyFifty {
                askTheAudience()
            } else {
                askTheAudienceAfterFiftyFifty()
            }
        default:
            break
        }
    }
    
}
