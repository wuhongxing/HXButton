//
//  UIView+RectCorner.swift
//  Pods
//
//  Created by 吴红星 on 2020/4/8.
//

import Foundation

public struct RectCorner: OptionSet {
    public let rawValue: Int

    public static let topLeft = RectCorner(rawValue: 1 << 0)

    public static let topRight = RectCorner(rawValue: 1 << 1)

    public static let bottomLeft = RectCorner(rawValue: 1 << 2)

    public static let bottomRight = RectCorner(rawValue: 1 << 3)

    public static let allCorners: RectCorner = [.topLeft, .topRight, .bottomLeft, .bottomRight]
    
    public init(rawValue: Int) {
        self.rawValue = rawValue
    }
}

extension UIView: HXCompatible { }

private var cornerTypeKey: Void?
private var cornerRadiusKey: Void?
private var borderWidthKey: Void?
private var borderColorKey: Void?
extension HXWrapped where Base: UIView {
    
    public var cornerType: UIRectCorner {
        set {
            setRetainedAssociatedObject(base, &cornerTypeKey, newValue)
        }
        get {
            getAssociatedObject(base, &cornerTypeKey) ?? .allCorners
        }
    }
    
    public var cornerRadius: CGFloat {
        set {
            setRetainedAssociatedObject(base, &cornerRadiusKey, newValue)
        }
        get {
            getAssociatedObject(base, &cornerRadiusKey) ?? 0.0
        }
    }
    
    public var borderWidth: CGFloat {
        set {
            setRetainedAssociatedObject(base, &borderWidthKey, newValue)
        }
        get {
            getAssociatedObject(base, &borderWidthKey) ?? 0
        }
    }
    
    public var borderColor: UIColor? {
        set {
            setRetainedAssociatedObject(base, &borderColorKey, newValue)
        }
        get {
            getAssociatedObject(base, &borderColorKey)
        }
    }
    
    public func cornerType(_ type: UIRectCorner) -> Self {
        var `self` = self
        `self`.cornerType = type
        return `self`
    }
    
    public func cornerRadius(_ radius: CGFloat) -> Self {
        var `self` = self
        `self`.cornerRadius = radius
        return `self`
    }
    
    public func borderWidth(_ width: CGFloat) -> Self {
        var `self` = self
        `self`.borderWidth = width
        return `self`
    }
    
    public func borderColor(_ color: UIColor) -> Self {
        var `self` = self
        `self`.borderColor = color
        return `self`
    }
    
    public func make() {
        let bezierPath = UIBezierPath(roundedRect: base.bounds, byRoundingCorners: cornerType, cornerRadii: CGSize(width: cornerRadius, height: cornerRadius))
        
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = bezierPath.cgPath
        shapeLayer.frame = base.bounds
        
        let borderLayer = CAShapeLayer()
        borderLayer.path = bezierPath.cgPath
        borderLayer.fillColor = UIColor.clear.cgColor
        borderLayer.strokeColor = borderColor?.cgColor
        borderLayer.lineWidth = borderWidth
        borderLayer.frame = base.bounds
        
        base.layer.mask = shapeLayer
        base.layer.addSublayer(borderLayer)
    }
}
