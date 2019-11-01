//
//  MainViewController.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 19.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupBackgroundImage()
        configureButtons()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
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
        buttons.forEach {
            $0.configure()
        }
    }

    @IBAction func playButtonTapped(_ sender: UIButton) {
        Game.shared.gameSession = GameSession()
        let storyboard = UIStoryboard(name: "Game", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "GameViewController") as! GameViewController
        self.show(vc, sender: nil)
    }
    
    @IBAction func resultsButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Records", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RecordTableViewController") as! RecordTableViewController
        self.show(vc, sender: nil)
    }
    
    @IBAction func settingsButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Settings", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SettingsViewController") as! SettingsViewController
        self.show(vc, sender: nil)
    }
    
    @IBAction func addQuestionButtonTapped(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "AddQuestion", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "AddQuestionViewController") as! AddQuestionViewController
        self.show(vc, sender: nil)
    }
}
