//
//  UIButton+HXState.swift
//  Pods
//
//  Created by 吴红星 on 2020/4/9.
//

import Foundation

private var animationKey: Void?
private var selectedBackgroundColorKey: Void?
private var borderDictionaryKey: Void?

extension HXWrapped where Base: UIButton {
    public var animation: TimeInterval {
        set {
            setRetainedAssociatedObject(base, &animationKey, newValue)
        }
        get {
            getAssociatedObject(base, &animationKey) ?? 0.0
        }
    }
    
    public func backgroundColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        let `self` = self
        switch state {
        case .normal:
            base.backgroundColor = color
        case .highlighted:
            base.setBackgroundImage(color.hx.image, for: .highlighted)
        case .selected:
            base.setBackgroundImage(color.hx.image, for: .selected)
        default:
            break
        }
        return `self`
    }
    
    private var borderDictionary: [String: UIColor] {
        set {
            setRetainedAssociatedObject(base, &borderDictionaryKey, newValue)
        }
        get {
            getAssociatedObject(base, &borderDictionaryKey) ?? [String: UIColor]()
        }
    }
    
    public func borderColor(_ color: UIColor, state: UIControl.State = .normal) -> Self {
        var `self` = self
        let key = "borderKey_\(state)"
        `self`.borderDictionary[key] = color
        return `self`
    }
}
