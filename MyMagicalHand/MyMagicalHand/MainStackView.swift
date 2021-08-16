//
//  MainStackView.swift
//  MyMagicalHand
//
//  Created by 김민성 on 2021/08/16.
//

import UIKit

class MainStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func configure() {
        axis = .vertical
        alignment = .fill
        distribution = .fill
        spacing = 10
        translatesAutoresizingMaskIntoConstraints = false
    }
}
