//
//  UISegmentControl.swift
//  ParkForU
//
//  Created by Binty Shah on 7/5/16.
//  Copyright © 2016 Binty Shah. All rights reserved.
//

import Foundation
import UIKit

extension UISegmentedControl {
    
    func removeBorders() {
        setBackgroundImage(imageWithColor(color: UIColor.white), for: .normal, barMetrics: .default)
        setBackgroundImage(imageWithColor(color: UIColor.Color_LightGray()), for: .selected, barMetrics: .default)
        setDividerImage(imageWithColor(color: UIColor.clear), forLeftSegmentState: .normal, rightSegmentState: .normal, barMetrics: .default)
    }
    
    func MultiLine() {
        for segment in subviews
        {
            for subview in segment.subviews
            {
                if let segmentLabel = subview as? UILabel
                {
                    segmentLabel.numberOfLines = 0
                }
            }
        }
    }
    
    // create a 1x1 image with this color
    private func imageWithColor(color: UIColor) -> UIImage {
        let rect = CGRect(x: 0.0, y: 0.0, width: 1.0, height: 1.0);        UIGraphicsBeginImageContext(rect.size)
        let context = UIGraphicsGetCurrentContext()
        context!.setFillColor(color.cgColor);
        context!.fill(rect);
        let image = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
        return image!
    }
}
