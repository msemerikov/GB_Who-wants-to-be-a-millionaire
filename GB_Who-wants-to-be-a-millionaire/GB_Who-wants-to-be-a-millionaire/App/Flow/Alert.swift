//
//  Alert.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 20.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

class Alert {
    
    enum Decision {
        case accept
        case reject
    }
    
    let question: String
    let acceptTitle: String
    let rejectTitle: String?
    let complition: ((Decision) -> Void)?
    
    init(question: String, acceptTitle: String, rejectTitle: String? = nil, complition: ((Decision) -> Void)? = nil ) {
        self.question = question
        self.acceptTitle = acceptTitle
        self.rejectTitle = rejectTitle
        self.complition = complition
    }
    
    func present(in controller: UIViewController) {
        let alert = UIAlertController(title: nil, message: question, preferredStyle: .alert)
        let acceptAction = UIAlertAction(title: acceptTitle, style: .default) { _ in
            self.complition?(.accept)
            controller.dismiss(animated: true)
        }
        alert.addAction(acceptAction)
        if let rejectTitle = rejectTitle {
            let rejectAction = UIAlertAction(title: rejectTitle, style: .cancel) { _ in
                self.complition?(.reject)
            }
            alert.addAction(rejectAction)
        }
        controller.present(alert, animated: true)
    }
}
