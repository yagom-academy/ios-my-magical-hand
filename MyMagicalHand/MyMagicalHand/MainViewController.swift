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
    
    // MARK: - drwaing
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        touchPoint = touch.location(in: drawingView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first, let lastPoint = touchPoint else {
            return
        }
        let currentPoint = touch.location(in: drawingView)
        let imageView = drawingView.frame.size
        
        UIGraphicsBeginImageContext(imageView)
        drawingView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.width, height: imageView.height))
        
        UIGraphicsGetCurrentContext()?.setLineWidth(10.0)
        UIGraphicsGetCurrentContext()?.setLineCap(CGLineCap.round)
        UIGraphicsGetCurrentContext()?.setStrokeColor(UIColor.label.cgColor)
        UIGraphicsGetCurrentContext()?.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        UIGraphicsGetCurrentContext()?.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        UIGraphicsGetCurrentContext()?.strokePath()
        
        drawingView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        touchPoint = currentPoint
    }
}
