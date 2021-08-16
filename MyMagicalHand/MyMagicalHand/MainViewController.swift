//
//  MyMagicalHand - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    let mainImageView = UIImageView()
    let tempImageView = UIImageView()
    let canvasView = UIView()
    let resultLabel = UILabel()
    let probabilityLabel = UILabel()
    let estimateButton = UIButton()
    let resetButton = UIButton()
    let mainStackView = MainStackView()
    let buttonStackView = ButtonStackView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray
        configureMainImageView()
        configureTempImageView()
        configureEstimateButton()
        configureResetButton()
        configureCanvasView()
        configureButtonStackView()
        configureMainStackView()
    }
    
    func configureMainImageView() {
        canvasView.addSubview(mainImageView)
    }
    
    func configureTempImageView() {
        canvasView.addSubview(tempImageView)
    }
    
    func configureEstimateButton() {
        estimateButton.setTitle("결과보기", for: .normal)
        buttonStackView.addArrangedSubview(estimateButton)
    }
    
    func configureResetButton() {
        resetButton.setTitle("지우기", for: .normal)
        buttonStackView.addArrangedSubview(resetButton)
    }
    
    func configureCanvasView() {
        mainStackView.addArrangedSubview(canvasView)
    }
    
    func configureButtonStackView() {
        mainStackView.addArrangedSubview(buttonStackView)
    }
    
    func configureResultLabel() {
        mainStackView.addArrangedSubview(resultLabel)
    }
    
    func configureProbabilityLabel() {
        mainStackView.addArrangedSubview(probabilityLabel)
    }
    
    func configureMainStackView() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 200),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
