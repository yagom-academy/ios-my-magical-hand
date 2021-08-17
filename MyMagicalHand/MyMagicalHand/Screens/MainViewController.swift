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
    let shapeLabel = ResultLabel()
    let probabilityLabel = ResultLabel()
    let estimateButton = UIButton()
    let resetButton = UIButton()
    let mainStackView = MainStackView()
    let buttonStackView = ButtonStackView()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.systemGray
        configureMainImageView()
        configureEstimateButton()
        configureResetButton()
        configureTempImageView()
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
        buttonStackView.addArrangedSubview(estimateButton)
        estimateButton.setTitle("결과보기", for: .normal)
        estimateButton.setTitleColor(UIColor.systemOrange, for: .normal)
    }
    
    func configureResetButton() {
        buttonStackView.addArrangedSubview(resetButton)
        resetButton.setTitle("지우기", for: .normal)
        resetButton.setTitleColor(UIColor.white, for: .normal)
    }
    
    func configureCanvasView() {
        mainStackView.addArrangedSubview(canvasView)
    }
    
    func configureButtonStackView() {
        mainStackView.addArrangedSubview(buttonStackView)
        
        NSLayoutConstraint.activate([
            buttonStackView.heightAnchor.constraint(equalToConstant: view.frame.size.height / 20)
        ])
    }
    
    func configureResultLabel() {
        mainStackView.addArrangedSubview(shapeLabel)
        shapeLabel.text = "모양입니다"
        
        NSLayoutConstraint.activate([
            shapeLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 20)
        ])
    }
    
    func configureProbabilityLabel() {
        mainStackView.addArrangedSubview(probabilityLabel)
        probabilityLabel.text = "100 %"
        
        NSLayoutConstraint.activate([
            probabilityLabel.heightAnchor.constraint(equalToConstant: view.frame.height / 20)
        ])
    }
    
    func configureMainStackView() {
        view.addSubview(mainStackView)
        mainStackView.layoutMargins = UIEdgeInsets(top: view.frame.size.height / 6, left: view.frame.size.width / 20,
                                                   bottom: view.frame.size.height / 6, right: view.frame.size.width / 20)
        
        NSLayoutConstraint.activate([
            mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
}
