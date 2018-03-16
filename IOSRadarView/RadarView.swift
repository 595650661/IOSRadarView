//
//  RadarView.swift
//  IOSRadarView
//
//  Created by 乔晓松 on 2018/3/15.
//  Copyright © 2018年 coolspan. All rights reserved.
//

import UIKit

class RadarView: UIView {
    
    //边数
    private var data: [RadarModel]!
    private var side: Int!
    private var shapeLayer: CAShapeLayer!
    private var reginLayer: CAShapeLayer!
    
    //视图宽度、高度
    private var width: CGFloat!
    private var centerX: CGFloat!
    private var centerY: CGFloat!
    //网状半径
    private var radius: CGFloat!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initData(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

//MARK:- private methods
private extension RadarView {
    
    func initData(frame: CGRect) {
        width = min(frame.size.width, frame.size.height)
        centerX = frame.size.width / 2
        centerY = frame.size.height / 2
        radius = width / 2 * 0.7
    }
    
    func updateLayer() {
        //绘制的Path路径
        let path = CGMutablePath()
        //网状半径之间的间距
        let radiuSpace: CGFloat = radius / CGFloat((side - 1))
//        print("r:\(radiuSpace)")
        //角度
        let angle: CGFloat = CGFloat(Double.pi * 2 / Double(side))
        let centerPoint = CGPoint(x: centerX, y: centerY)
        
        for ring in 0..<side {
            let currentRadius: CGFloat = CGFloat(ring) * radiuSpace
//            print("currentRadius:\(currentRadius)")
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
        
        let percentPath = CGMutablePath()
        var array = [CGPoint]()
        for node in 0..<side {
            let x: CGFloat = radius * sin(angle / 2 + angle * CGFloat(node)) * data[node].percent + centerX
            let y: CGFloat = radius * cos(angle / 2 + angle * CGFloat(node)) * data[node].percent + centerY
            array.append(CGPoint(x: x, y: y))
        }
        percentPath.addLines(between: array)
        
        UIView.beginAnimations(nil, context: nil)
        UIView.setAnimationDuration(0.35)
        if shapeLayer == nil {
            shapeLayer = CAShapeLayer()
            shapeLayer.fillColor = UIColor.clear.cgColor
            shapeLayer.backgroundColor = UIColor.clear.cgColor
            shapeLayer.path = path
            shapeLayer.lineWidth = 1
            shapeLayer.strokeColor = UIColor.red.cgColor
            shapeLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
            layer.insertSublayer(shapeLayer, at: 0)
        } else {
            shapeLayer.path = path
        }
        
        if reginLayer == nil {
            reginLayer = CAShapeLayer()
            reginLayer.fillColor = UIColor.init(red: 1, green: 0, blue: 0, alpha: 0.2).cgColor
            reginLayer.backgroundColor = UIColor.clear.cgColor
            reginLayer.path = percentPath
            reginLayer.lineWidth = 1
            reginLayer.strokeColor = UIColor.red.cgColor
            reginLayer.frame = CGRect(x: 0, y: 0, width: frame.size.width, height: frame.size.height)
//            layer.insertSublayer(reginLayer, at: 0)
            layer.insertSublayer(reginLayer, above: shapeLayer)
        } else {
            reginLayer.path = percentPath
        }
        
        
        UIView.commitAnimations()
        
    }
}

//MARK:- public methods
extension RadarView {
    
    /// 设置数据
    ///
    /// - Parameter data: 数据列表
    func setData(data: [RadarModel]) {
//        print("setData:\(data)")
        self.data = data
        self.side = self.data.count
        self.updateLayer()
    }
}
