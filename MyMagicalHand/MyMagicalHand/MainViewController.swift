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
        configureResetButton()
        configureTempImageView()
        configureEstimateButton()
        configureCanvasView()
        configureButtonStackView()
        configureResultLabel()
        configureProbabilityLabel()
        configureMainStackView()

    }
    
    func configureMainImageView() {
        canvasView.addSubview(mainImageView)
        mainImageView.backgroundColor = UIColor.white
        mainImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            mainImageView.topAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.topAnchor),
            mainImageView.bottomAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.bottomAnchor),
            mainImageView.leadingAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.leadingAnchor),
            mainImageView.trailingAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func configureTempImageView() {
        canvasView.addSubview(tempImageView)
        tempImageView.backgroundColor = UIColor.white
        tempImageView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            tempImageView.topAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.topAnchor),
            tempImageView.bottomAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.bottomAnchor),
            tempImageView.leadingAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.leadingAnchor),
            tempImageView.trailingAnchor.constraint(equalTo: canvasView.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
    func configureEstimateButton() {
        estimateButton.setTitle("결과보기", for: .normal)
        estimateButton.setTitleColor(UIColor.systemOrange, for: .normal)
        buttonStackView.addArrangedSubview(estimateButton)
    }
    
    func configureResetButton() {
        resetButton.setTitle("지우기", for: .normal)
        resetButton.setTitleColor(UIColor.systemOrange, for: .normal)
        buttonStackView.addArrangedSubview(resetButton)
    }
    
    func configureCanvasView() {
        mainStackView.addArrangedSubview(canvasView)
        
        NSLayoutConstraint.activate([
            canvasView.widthAnchor.constraint(equalTo: mainStackView.safeAreaLayoutGuide.widthAnchor),
            canvasView.heightAnchor.constraint(equalToConstant: 400)
        ])
    }
    
    func configureButtonStackView() {
        mainStackView.addArrangedSubview(buttonStackView)
    }
    
    func configureResultLabel() {
        mainStackView.addArrangedSubview(resultLabel)
        resultLabel.text = "hi"
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            resultLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 12)
        ])
    }
    
    func configureProbabilityLabel() {
        mainStackView.addArrangedSubview(probabilityLabel)
        probabilityLabel.text = "hihihih"
        probabilityLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            probabilityLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 12)
        ])
    }
    
    func configureMainStackView() {
        view.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 150),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
