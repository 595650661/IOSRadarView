//
//  RadarViewController.swift
//  IOSRadarView
//
//  Created by 乔晓松 on 2018/3/15.
//  Copyright © 2018年 coolspan. All rights reserved.
//

import UIKit
import SnapKit

class RadarViewController: UIViewController {
    
    var radarView: RadarView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initSubviews()
        
    }
    
}

extension RadarViewController {
    
    func initSubviews() {
        print("initSubviews")
        
        radarView = RadarView(frame: CGRect(x: (UIScreen.main.bounds.width
            - 350) / 2, y: 50, width: 350, height: 350))
//        radarView.backgroundColor = UIColor.green
        radarView.setData(data: [RadarModel(title: "语文", percent: 0.9), RadarModel(title: "数学", percent: 0.2), RadarModel(title: "英语", percent: 0.9), RadarModel(title: "物理", percent: 0.2), RadarModel(title: "化学", percent: 0.9), RadarModel(title: "生物", percent: 0.2)])
        view.addSubview(radarView)
        let fiveButton = UIButton()
        fiveButton.layer.cornerRadius = 8
        fiveButton.backgroundColor = UIColor.red
        fiveButton.setTitle("五边形", for: .normal)
        fiveButton.addTarget(self, action: #selector(onFiveAction), for: .touchUpInside)
        view.addSubview(fiveButton)
        fiveButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalToSuperview().offset(8)
        }
        
        let sixButton = UIButton()
        sixButton.layer.cornerRadius = 8
        sixButton.backgroundColor = UIColor.red
        sixButton.setTitle("六边形", for: .normal)
        sixButton.addTarget(self, action: #selector(onSixAction), for: .touchUpInside)
        view.addSubview(sixButton)
        sixButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.bottom.equalToSuperview().offset(-8)
            make.left.equalTo(fiveButton.snp.right).offset(8)
        }
        
        let sevenButton = UIButton()
        sevenButton.layer.cornerRadius = 8
        sevenButton.backgroundColor = UIColor.red
        sevenButton.setTitle("七边形", for: .normal)
        sevenButton.addTarget(self, action: #selector(onSevenAction), for: .touchUpInside)
        view.addSubview(sevenButton)
        sevenButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.bottom.equalTo(sixButton.snp.top).offset(-8)
            make.left.equalToSuperview().offset(8)
        }
        
        let nightButton = UIButton()
        nightButton.layer.cornerRadius = 8
        nightButton.backgroundColor = UIColor.red
        nightButton.setTitle("八边形", for: .normal)
        nightButton.addTarget(self, action: #selector(onNightAction), for: .touchUpInside)
        view.addSubview(nightButton)
        nightButton.snp.makeConstraints { (make) in
            make.width.equalTo(150)
            make.height.equalTo(60)
            make.bottom.equalTo(sixButton.snp.top).offset(-8)
            make.left.equalTo(sevenButton.snp.right).offset(8)
        }
        
        
    }
    
    @objc func onNightAction() {
        radarView.setData(data: [RadarModel(title: "北京", percent: 0.9), RadarModel(title: "上海", percent: 0.2), RadarModel(title: "厦门", percent: 0.9), RadarModel(title: "珠海", percent: 0.2), RadarModel(title: "天津", percent: 0.9), RadarModel(title: "河北", percent: 0.2),
                                 RadarModel(title: "河南", percent: 0.9), RadarModel(title: "南京", percent: 0.4)])
    }
    
    @objc func onSevenAction() {
        radarView.setData(data: [RadarModel(title: "北京", percent: 0.9), RadarModel(title: "上海", percent: 0.2), RadarModel(title: "厦门", percent: 0.9), RadarModel(title: "珠海", percent: 0.8), RadarModel(title: "天津", percent: 0.9), RadarModel(title: "河北", percent: 0.2),
                                 RadarModel(title: "河南", percent: 0.6)])
    }
    
    @objc func onSixAction() {
        radarView.setData(data: [RadarModel(title: "北京", percent: 0.9), RadarModel(title: "上海", percent: 0.2), RadarModel(title: "厦门", percent: 0.9), RadarModel(title: "珠海", percent: 0.8), RadarModel(title: "天津", percent: 0.6), RadarModel(title: "河北", percent: 0.2)])
    }
    
    @objc func onFiveAction() {
        radarView.setData(data: [RadarModel(title: "北京", percent: 0.4), RadarModel(title: "上海", percent: 0.2), RadarModel(title: "厦门", percent: 0.6), RadarModel(title: "珠海", percent: 0.8), RadarModel(title: "天津", percent: 0.1)])
    }
}
