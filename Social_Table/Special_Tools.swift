//
//  Special_Tools.swift
//  Social_Table
//
//  Created by Nathaniel Mcdowell on 7/29/19.
//  Copyright © 2019 Nathaniel Mcdowell. All rights reserved.
//

import UIKit

func UIColorFromRGB(rgbValue :Int, alpha :Float) -> UIColor {
   
    let thisAlpha = CGFloat(alpha)
   let convertedColor = UIColor(red:((CGFloat)((rgbValue & 0xFF0000) >> 16))/255.0,
            green:((CGFloat)((rgbValue & 0x00FF00) >>  8))/255.0,
            blue:((CGFloat)((rgbValue & 0x0000FF) >>  0))/255.0,
            alpha: thisAlpha)
    return convertedColor
}


