//
//  UIView.swift
//  FireBase
//
//  Created by Kaplan2 on 31/05/23.
//

import UIKit

extension UIView {
    
    @IBInspectable
    var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.cornerRadius = newValue
        }
    }
    
    @IBInspectable
    var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        } set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable
    var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor.init(cgColor: color)
            }
            return nil
        } set {
            layer.borderColor = newValue?.cgColor
        }
    }
    
}
