//
//  ResultLabel.swift
//  MyMagicalHand
//
//  Created by 김민성 on 2021/08/17.
//

import UIKit

class ResultLabel: UILabel {

    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        textColor = .white
        textAlignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }
}
