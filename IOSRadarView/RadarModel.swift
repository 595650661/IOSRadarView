//
//  RadarModel.swift
//  IOSRadarView
//
//  Created by 乔晓松 on 2018/3/16.
//  Copyright © 2018年 coolspan. All rights reserved.
//

import UIKit

class RadarModel: NSObject {

    var title: String!
    var percent: CGFloat!
    
    init(title: String, percent: CGFloat) {
        super.init()
        self.title = title
        self.percent = percent
    }
}
