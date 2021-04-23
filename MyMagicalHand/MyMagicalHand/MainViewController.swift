//
//  MyMagicalHand - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class MainViewController: UIViewController {
    
    // MARK: - properties
    
    var touchPoint: CGPoint?
    
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var persentButton: UILabel!
    @IBOutlet weak var drawingView: UIImageView!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabels()
    }

    // MARK: - handle buttons
    
    @IBAction func touchUpResultButton() {
        // test message
        resultLabel.text = "동그라미처럼 보이네요."
        persentButton.text = "99%"
    }
    
    @IBAction func touchUpClearButton() {
        clearLabels()
        drawingView.image = nil
    }
    
    func clearLabels() {
        resultLabel.text = String.empty
        persentButton.text = String.empty
    }
}
