//
//  Pen.swift
//  MyMagicalHand
//
//  Created by Kyungmin Lee on 2021/04/28.
//

import UIKit

struct Pen {
    var currentPoint = CGPoint.zero
    var lineCap = CGLineCap.round
    var blendMode = CGBlendMode.normal
    var width: CGFloat = 10.0
    var color = UIColor.black.cgColor
}
