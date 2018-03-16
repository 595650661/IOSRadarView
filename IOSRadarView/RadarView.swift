//
//  RadarView.swift
//  IOSRadarView
//
//  Created by 乔晓松 on 2018/3/15.
//  Copyright © 2018年 coolspan. All rights reserved.
//

import UIKit

class RadarView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- private methods
private extension RadarView {
    
    func initSubviews(frame: CGRect) {
        //绘制的Path路径
        let path = CGMutablePath()
        //边数
        let side: Int = 6
        //视图宽度、高度
        let width: CGFloat = min(frame.size.width, frame.size.height)
        let centerX = frame.size.width / 2
        let centerY = frame.size.height / 2
        //网状半径
        let radius = width / 2 * 0.7
        //网状半径之间的间距
        let radiuSpace: CGFloat = radius / CGFloat((side - 1))
        print("r:\(radiuSpace)")
        //角度
        let angle: CGFloat = CGFloat(Double.pi * 2 / Double(side))
        let centerPoint = CGPoint(x: centerX, y: centerY)
        for ring in 0..<side {
            let currentRadius: CGFloat = CGFloat(ring) * radiuSpace
            print("currentRadius:\(currentRadius)")
            var array = [CGPoint]()
            for node in 0..<side {
                let x: CGFloat = currentRadius * CGFloat(sin(angle / 2 + angle * CGFloat(node))) + centerX
                let y: CGFloat = currentRadius * CGFloat(cos(angle / 2 + angle * CGFloat(node))) + centerY
                let currentPoint = CGPoint(x: x, y: y)
                array.append(currentPoint)
                path.addLines(between: [currentPoint, centerPoint])
            }
            array.append(array[0])
            path.addLines(between: array)
        }
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.fillColor = UIColor.yellow.cgColor
        shapeLayer.backgroundColor = UIColor.orange.cgColor
        shapeLayer.path = path
        shapeLayer.lineWidth = 1
        shapeLayer.strokeColor = UIColor.red.cgColor
        shapeLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
        layer.insertSublayer(shapeLayer, at: 0)
        
        
        
    }
}
