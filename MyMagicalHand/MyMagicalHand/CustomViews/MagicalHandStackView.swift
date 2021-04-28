//
//  MagicalHandStackView.swift
//  MyMagicalHand
//
//  Created by 김호준 on 2021/04/28.
//

import UIKit

class MagicalHandStackView: UIStackView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        configure()
    }
    
    init(axis: NSLayoutConstraint.Axis, distribution: UIStackView.Distribution) {
        super.init(frame: .zero)
        configure()
        self.axis = axis
        self.distribution = distribution
    }
    
    private func configure() {
        alignment = .center
        translatesAutoresizingMaskIntoConstraints = false
    }

}
