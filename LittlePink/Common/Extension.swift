//
//  Extension.swift
//  LittlePink
//
//  Created by yuming.zheng on 2023/6/6.
//

import Foundation
import UIKit

extension UIView{
    @IBInspectable
    var radius: CGFloat{
        get{
            layer.cornerRadius
        }
        set{
            layer.cornerRadius = newValue
        }
    }
}
