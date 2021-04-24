//
//  MyMagicalHand - MainViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    
    // MARK: - properties
    
    private var touchPoint: CGPoint?
    
    @IBOutlet private weak var resultLabel: UILabel!
    @IBOutlet private weak var persentButton: UILabel!
    @IBOutlet private weak var drawingView: UIImageView!
    
    // MARK: - life cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        clearLabels()
    }
    
    // MARK: - handle buttons
    
    @IBAction private func touchUpResultButton() {
        // test message
        resultLabel.text = "동그라미처럼 보이네요."
        persentButton.text = "99%"
    }
    
    @IBAction private func touchUpClearButton() {
        clearLabels()
        drawingView.image = nil
    }
    
    private func clearLabels() {
        resultLabel.text = String.empty
        persentButton.text = String.empty
    }
    
    // MARK: - drawing
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        touchPoint = touches.first?.location(in: drawingView)
        super.touchesBegan(touches, with: event)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        let imageView = drawingView.frame.size
        
        UIGraphicsBeginImageContext(imageView)
        
        guard let context = UIGraphicsGetCurrentContext(), let touch = touches.first, let lastPoint = touchPoint else {
            return
        }
        let currentPoint = touch.location(in: drawingView)
        
        drawingView.image?.draw(in: CGRect(x: 0, y: 0, width: imageView.width, height: imageView.height))
        
        context.setLineWidth(10.0)
        context.setLineCap(CGLineCap.round)
        context.setStrokeColor(UIColor.label.cgColor)
        
        context.move(to: CGPoint(x: lastPoint.x, y: lastPoint.y))
        context.addLine(to: CGPoint(x: currentPoint.x, y: currentPoint.y))
        context.strokePath()
        
        touchPoint = currentPoint
        drawingView.image = UIGraphicsGetImageFromCurrentImageContext()
        
        UIGraphicsEndImageContext()
        
        super.touchesMoved(touches, with: event)
    }
}
