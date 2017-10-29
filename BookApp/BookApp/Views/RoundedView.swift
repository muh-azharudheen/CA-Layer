//
//  RoundedView.swift
//  BookApp
//
//  Created by MS1 on 10/29/17.
//  Copyright © 2017 MS1. All rights reserved.
//

import UIKit

@IBDesignable
class RoundedView: UIView {

    override func layoutSubviews() {
        super.layoutSubviews()
        setupMaskLayer()
    }
    
    private func setupMaskLayer(){
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topRight, .topLeft], cornerRadii: CGSize(width: 30, height: 30)).cgPath
        layer.mask = shapeLayer
    }
    
}
