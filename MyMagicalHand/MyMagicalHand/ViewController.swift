//
//  MyMagicalHand - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class ViewController: UIViewController {
    
    private let canvasView = CanvasView()
    private let resultButton = UIButton(type: .system)
    private let eraseButton = UIButton(type: .system)
    private let shapeLabel = UILabel()
    private let precisionLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .darkGray
        view.addSubview(canvasView)
        canvasView.translatesAutoresizingMaskIntoConstraints = false
        canvasView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -30).isActive = true
        canvasView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        canvasView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        canvasView.heightAnchor.constraint(equalTo: canvasView.widthAnchor).isActive = true
        
        view.addSubview(resultButton)
        resultButton.translatesAutoresizingMaskIntoConstraints = false
        resultButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 10).isActive = true
        resultButton.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 10).isActive = true
        resultButton.setTitle("결과보기", for: .normal)
        resultButton.setTitleColor(.systemYellow, for: .normal)
    
        view.addSubview(eraseButton)
        eraseButton.translatesAutoresizingMaskIntoConstraints = false
        eraseButton.topAnchor.constraint(equalTo: canvasView.bottomAnchor, constant: 10).isActive = true
        eraseButton.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -10).isActive = true
        eraseButton.setTitle("지우기", for: .normal)
        eraseButton.setTitleColor(.white, for: .normal)
        
        shapeLabel.text = "처럼 보이네요."
        shapeLabel.textColor = .white
        shapeLabel.isHidden = true
        precisionLabel.text = "0%"
        precisionLabel.textColor = .white
        precisionLabel.isHidden = true
        
        let labelStackView = UIStackView()
        labelStackView.axis = .vertical
        labelStackView.alignment = .center
        labelStackView.distribution = .equalSpacing
        labelStackView.addArrangedSubview(shapeLabel)
        labelStackView.addArrangedSubview(precisionLabel)
        
        view.addSubview(labelStackView)
        labelStackView.translatesAutoresizingMaskIntoConstraints = false
        labelStackView.topAnchor.constraint(equalTo: resultButton.bottomAnchor, constant: 20).isActive = true
        labelStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        resultButton.addTarget(self, action: #selector(touchUpResultButton), for: .touchUpInside)
        eraseButton.addTarget(self, action: #selector(touchUpEraseButton), for: .touchUpInside)
    }
    
    @objc func touchUpResultButton() {
        shapeLabel.isHidden = false
        precisionLabel.isHidden = false
    }
    
    @objc func touchUpEraseButton() {
        canvasView.eraseAll()
    }
}

