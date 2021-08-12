//
//  MyMagicalHand - DrawingViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class DrawingViewController: UIViewController {

    let drawingView = DrawingView()
    var lastPoint = CGPoint.zero
    var color = UIColor.black
    var brushWidth: CGFloat = 10.0
    var opacity: CGFloat = 1.0
    var swiped = false

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .darkGray
        view.layoutMargins = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 10)
        self.view.addSubview(drawingView)
        drawingView.configure()

        NSLayoutConstraint.activate([
            drawingView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
            drawingView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
            drawingView.centerYAnchor.constraint(equalTo: view.layoutMarginsGuide.centerYAnchor),
            drawingView.heightAnchor.constraint(equalTo: view.layoutMarginsGuide.heightAnchor, multiplier: 0.7)
        ])
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = false
        lastPoint = touch.location(in: drawingView.canvasView)
    }

    func drawLine(from fromPoint: CGPoint, to toPoint: CGPoint) {
        UIGraphicsBeginImageContext(drawingView.canvasView.frame.size)
        guard let context = UIGraphicsGetCurrentContext() else {
            return
        }
        drawingView.canvasView.image?.draw(in: drawingView.canvasView.bounds)
        context.move(to: fromPoint)
        context.addLine(to: toPoint)
        context.setLineCap(.round)
        context.setBlendMode(.normal)
        context.setLineWidth(brushWidth)
        context.setStrokeColor(color.cgColor)
        context.strokePath()
        drawingView.canvasView.image = UIGraphicsGetImageFromCurrentImageContext()
        drawingView.canvasView.alpha = opacity
        UIGraphicsEndImageContext()
    }

    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        swiped = true
        let currentPoint = touch.location(in: drawingView.canvasView)
        drawLine(from: lastPoint, to: currentPoint)
        lastPoint = currentPoint
    }

    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if !swiped {
            drawLine(from: lastPoint, to: lastPoint)
        }
    }
}
