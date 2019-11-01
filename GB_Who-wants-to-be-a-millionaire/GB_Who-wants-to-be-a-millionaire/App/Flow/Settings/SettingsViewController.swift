//
//  SettingsViewController.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 01.11.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var orderQuestionsLabel: UILabel!
    @IBOutlet weak var orderQuestionsSwitch: UISwitch!
    @IBOutlet weak var loadQuestionsButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        configureButtons()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        configureSwitch()
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
        loadQuestionsButton.configure()
    }
    
    func configureSwitch() {
        if Game.shared.orderQuestions == .random {
            orderQuestionsSwitch.isOn = true
        } else {
            orderQuestionsSwitch.isOn = false
        }
    }
    
    @IBAction func switchTapped(_ sender: UISwitch) {
        switch self.orderQuestionsSwitch.isOn {
        case true:
            Game.shared.orderQuestions = .random
        case false:
            Game.shared.orderQuestions = .sequentially
        }
    }

    @IBAction func loadQuestionsTapped(_ sender: UIButton) {
        let questions = Questions().questions
        let gameDelegate = Game.shared
        questions.forEach {
            gameDelegate.addQuestion(question: $0)
        }
    }
    
}
