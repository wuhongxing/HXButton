//
//  UIButton+HXButton.swift
//  Pods
//
//  Created by 吴红星 on 2020/4/8.
//

import Foundation

public enum HXButtonLayoutType {
    case normal
    case `default`
    case contentCenterImageRight
    case contentCenterImageTop
    case contentCenterImageBottom
    case contentLeftImageLeft
    case contentLeftImageRight
    case contentRightImageLeft
    case contentRightImageRight
}

private var layoutTypeKey: Void?
private var paddingKey: Void?
private var paddingInsetKey: Void?
extension HXWrapped where Base: UIButton {
    public var layoutType: HXButtonLayoutType {
        set {
            setRetainedAssociatedObject(self, &layoutTypeKey, newValue)
        }
        get {
            getAssociatedObject(base, &layoutTypeKey) ?? .default
        }
    }
    
    public var padding: CGFloat {
        set {
            setRetainedAssociatedObject(base, &paddingKey, newValue)
        }
        get {
            getAssociatedObject(base, &paddingKey) ?? 0
        }
    }
    
    public var paddingInset: CGFloat {
        set {
            setRetainedAssociatedObject(base, &paddingInsetKey, newValue)
        }
        get {
            getAssociatedObject(base, &paddingInsetKey) ?? 5
        }
    }
    
    public func layout() {
        let imageWidth = base.imageView?.bounds.width ?? 0
        let imageHeight = base.imageView?.bounds.height ?? 0
        
        let titleWidth = base.titleLabel?.bounds.width ?? 0
        let titleHeight = base.titleLabel?.bounds.height ?? 0
        
        var imageEdgeInsets: UIEdgeInsets = .zero
        var titleEdgeInsets: UIEdgeInsets = .zero
        
        switch layoutType {
        case .normal:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: padding, bottom: 0, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: padding)
        case .contentCenterImageRight:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth - padding, bottom: 0, right: imageWidth)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleWidth + padding, bottom: 0, right: -titleWidth)
        case .contentCenterImageTop:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth, bottom: -imageHeight - padding, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: -titleHeight - padding, left: 0, bottom: 0, right: -titleWidth)
        case .contentCenterImageBottom:
            titleEdgeInsets = UIEdgeInsets(top: -imageHeight - padding, left: -imageWidth, bottom: 0, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: -titleHeight - padding, right: -titleWidth)
        case .contentLeftImageLeft:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: padding + paddingInset, bottom: 0, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: paddingInset, bottom: 0, right: 0)
            base.contentHorizontalAlignment = .left
        case .contentLeftImageRight:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: -imageWidth + paddingInset, bottom: 0, right: 0)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: titleWidth + padding + paddingInset, bottom: 0, right: 0)
            base.contentHorizontalAlignment = .right
        case .contentRightImageLeft:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: paddingInset + padding)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: paddingInset)
            base.contentHorizontalAlignment = .left
        case .contentRightImageRight:
            titleEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: imageWidth + padding + paddingInset)
            imageEdgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: paddingInset)
            base.contentHorizontalAlignment = .right
        default:
            break
        }
        
        base.titleEdgeInsets = titleEdgeInsets
        base.imageEdgeInsets = imageEdgeInsets
        
        if cornerRadius != 0 || borderWidth != 0 {
            make()
        }
    }
}

extension HXWrapped where Base: UIButton {
    public func layoutType(_ type: HXButtonLayoutType) -> Self {
        var `self` = self
        `self`.layoutType = type
        return `self`
    }
    
    public func padding(_ padding: CGFloat) -> Self {
        var `self` = self
        `self`.padding = padding
        return `self`
    }
    
    public func paddingInset(_ inset: CGFloat) -> Self {
        var `self` = self
        `self`.paddingInset = inset
        return `self`
    }
    
    public func frame(_ frame: CGRect) -> Self {
        let `self` = self
        base.frame = frame
        return `self`
    }
    
    public func title(_ title: String) -> Self {
        let `self` = self
        base.setTitle(title, for: .normal)
        return `self`
    }
    
    public func selectedTitle(_ title: String) -> Self {
        let `self` = self
        base.setTitle(title, for: .selected)
        return `self`
    }
    
    public func highlightedTitle(_ title: String) -> Self {
        let `self` = self
        base.setTitle(title, for: .highlighted)
        return `self`
    }
    
    public func titleColor(_ color: UIColor) -> Self {
        let `self` = self
        base.setTitleColor(color, for: .normal)
        return `self`
    }
    
    public func selectedTitleColor(_ color: UIColor) -> Self {
        let `self` = self
        base.setTitleColor(color, for: .selected)
        return `self`
    }
    
    public func highlightedTitleColor(_ color: UIColor) -> Self {
        let `self` = self
        base.setTitleColor(color, for: .highlighted)
        return `self`
    }
    
    public func disabledTitleColor(_ color: UIColor) -> Self {
        let `self` = self
        base.setTitleColor(color, for: .disabled)
        return `self`
    }
    
    public func titleFont(_ font: UIFont = .systemFont(ofSize: 15)) -> Self {
        let `self` = self
        base.titleLabel?.font = font
        return `self`
    }
    
    public func image(_ image: UIImage) -> Self {
        let `self` = self
        base.setImage(image, for: .normal)
        return `self`
    }
    
    public func selectedImage(_ image: UIImage) -> Self {
        let `self` = self
        base.setImage(image, for: .selected)
        return `self`
    }
    
    public func highlightedImage(_ image: UIImage) -> Self {
        let `self` = self
        base.setImage(image, for: .highlighted)
        return `self`
    }
    
    public func backgroundImage(_ image: UIImage) -> Self {
        let `self` = self
        base.setBackgroundImage(image, for: .normal)
        return `self`
    }
    
    public func selectedBackgroundImage(_ image: UIImage) -> Self {
        let `self` = self
        base.setBackgroundImage(image, for: .selected)
        return `self`
    }
    
    public func highlightedBackgroundImage(_ image: UIImage) -> Self {
        let `self` = self
        base.setBackgroundImage(image, for: .highlighted)
        return `self`
    }
    
    public func backgroundColor(_ color: UIColor) -> Self {
        let `self` = self
        base.backgroundColor = color
        return `self`
    }
}
