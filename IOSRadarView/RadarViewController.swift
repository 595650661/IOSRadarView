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

    override func viewDidLoad() {
        super.viewDidLoad()

        initSubviews()
        
    }

}

extension RadarViewController {
    
    func initSubviews() {
        print("initSubviews")
        
        let radarView = RadarView(frame: CGRect(x: 30, y: 50, width: 350, height: 350))
        radarView.backgroundColor = UIColor.green
//        radarView.frame = CGRect(x: 0, y: 0, width: 350, height: 350)
        view.addSubview(radarView)
//        radarView.snp.makeConstraints { (make) in
//            make.width.height.equalToSuperview()
//            make.top.left.equalToSuperview()
//        }
        
    }
}
