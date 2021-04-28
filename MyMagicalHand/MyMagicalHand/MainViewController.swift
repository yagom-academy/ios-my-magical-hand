//
//  MyMagicalHand - ViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

final class MainViewController: UIViewController {
    @IBOutlet weak var drawingImageView: UIImageView!
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var matchProbabilityLabel: UILabel!
    
    private lazy var pen: Pen = {
       Pen()
    }()
    
    @IBAction func touchUpEraseButton(_ sender: Any) {
        drawingImageView.image = nil
    }
}

// MARK: - Drawing Methods
extension MainViewController {
    private func setupContext(_ context: CGContext, with pen: Pen) {
        context.setLineCap(pen.lineCap)
        context.setBlendMode(pen.blendMode)
        context.setLineWidth(pen.width)
        context.setStrokeColor(pen.color)
    }
 
    private func drawLine(startPoint: CGPoint, endPoint: CGPoint) {
        UIGraphicsBeginImageContext(drawingImageView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        setupContext(context, with: pen)
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        context.strokePath()
        
        drawingImageView.image?.draw(in: drawingImageView.bounds)
        drawingImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        pen.currentPoint = touch.location(in: drawingImageView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let currentPoint = touch.location(in: drawingImageView)
        drawLine(startPoint: pen.currentPoint, endPoint: currentPoint)
        pen.currentPoint = currentPoint
    }
}
