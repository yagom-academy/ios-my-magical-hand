//
//  ButtonStackView.swift
//  MyMagicalHand
//
//  Created by 김민성 on 2021/08/16.
//

import UIKit

class ButtonStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        axis = .horizontal
        alignment = .fill
        distribution = .fillEqually
        spacing = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
