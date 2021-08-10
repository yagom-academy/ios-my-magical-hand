//
//  MyMagicalHand - DrawingViewController.swift
//  Created by yagom. 
//  Copyright © yagom. All rights reserved.
// 

import UIKit

class DrawingViewController: UIViewController {

    let drawingView = DrawingView()

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
}
