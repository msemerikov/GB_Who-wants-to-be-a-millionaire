//
//  UIBUtton+Ext.swift
//  GB_Who-wants-to-be-a-millionaire
//
//  Created by Mikhail Semerikov on 20.10.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

extension UIButton {
    func configure() {
        self.setTitleColor(.white, for: .normal)
        self.titleLabel?.font = .boldSystemFont(ofSize: 17)
        self.layer.borderWidth = 2.0
        self.layer.borderColor = (UIColor.white).cgColor
        self.layer.cornerRadius = 25
    }
}
