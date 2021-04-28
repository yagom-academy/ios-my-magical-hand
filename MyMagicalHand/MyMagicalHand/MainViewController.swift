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
    
    private var touchPoint = CGPoint.zero
    private var penWidth:CGFloat = 10.0
    private var penOpacity: CGFloat = 1.0
    private var penColor = UIColor.black
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

// MARK: - Drawing Methods
extension MainViewController {
    private func drawLine(startPoint: CGPoint, endPoint: CGPoint) {
        UIGraphicsBeginImageContext(drawingImageView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        
        drawingImageView.image?.draw(in: drawingImageView.bounds)
        
        context.move(to: startPoint)
        context.addLine(to: endPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(penWidth)
        context.setStrokeColor(penColor.cgColor)
        context.strokePath()
        
        drawingImageView.image = UIGraphicsGetImageFromCurrentImageContext()
        drawingImageView.alpha = penOpacity
        UIGraphicsEndImageContext()
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        touchPoint = touch.location(in: drawingImageView)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        let currentPoint = touch.location(in: drawingImageView)
        drawLine(startPoint: touchPoint, endPoint: currentPoint)
        touchPoint = currentPoint
    }
}
