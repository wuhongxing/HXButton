//
//  UIColor+HXKit.swift
//  Pods
//
//  Created by 吴红星 on 2020/4/9.
//

import UIKit

extension UIColor {
    public convenience init(_ rgbValue: UInt32) {
        self.init(red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0, green: CGFloat((rgbValue & 0xFF00) >> 8) / 255.0, blue: (CGFloat(rgbValue & 0xFF)) / 255.0, alpha: 1)
    }
}

extension UIColor: HXCompatible { }

extension HXWrapped where Base: UIColor {
    public func image(_ size: CGSize = CGSize(width: 1, height: 1)) -> UIImage? {
        UIGraphicsBeginImageContext(size)
        defer {
            UIGraphicsEndImageContext()
        }
        let context = UIGraphicsGetCurrentContext()
        context?.setFillColor(base.cgColor)
        context?.fill(CGRect(origin: CGPoint.zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
    
    public var image: UIImage {
        get {
            image() ?? UIImage()
        }
    }
}
