//
//  AddQuestionViewController.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 01.11.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class AddQuestionViewController: UIViewController {

    @IBOutlet weak var questionTextField: UITextField!
    @IBOutlet weak var firstAnswerTextField: UITextField!
    @IBOutlet weak var secondAnswerTextField: UITextField!
    @IBOutlet weak var thirdAnswerTextField: UITextField!
    @IBOutlet weak var fourthAnswerTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var answerSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        configureButtons()
    }
    
    func setupBackgroundImage() {
        let backgroundImageName = "background.png"
        guard let image =  UIImage(named: backgroundImageName) else {
            assertionFailure("Missing ​​\(backgroundImageName) asset")
            return
        }
        self.view.backgroundColor = UIColor(patternImage: image)
    }
    
    func configureButtons() {
        saveButton.configure()
    }
    
    @IBAction func saveButtonPressed(_ sender: UIButton) {
        guard let questionText = questionTextField.text,
        let firstAnswer = firstAnswerTextField.text,
        let secondAnswer = secondAnswerTextField.text,
        let thirdAnswer = thirdAnswerTextField.text,
        let fourthAnswer = fourthAnswerTextField.text
        else { return }
        let question = Question(question: questionText, answers: [firstAnswer, secondAnswer, thirdAnswer, fourthAnswer], rightAnswer: answerSegmentedControl.selectedSegmentIndex + 1)
        let gameDelegate = Game.shared
        gameDelegate.addQuestion(question: question)
        self.dismiss(animated: true, completion: nil)
    }

}
