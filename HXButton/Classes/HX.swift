//
//  HX.swift
//  Pods
//
//  Created by 吴红星 on 2020/4/8.
//

import Foundation

public struct HXWrapped<Base> {
    let base: Base
    
    init(_ base: Base) {
        self.base = base
    }
}

public protocol HXCompatible { }

extension HXCompatible {
    public var hx: HXWrapped<Self> {
        get { return HXWrapped(self) }
        set { }
    }
    
    public static var hx: HXWrapped<Self>.Type {
        get { return HXWrapped<Self>.self }
        set { }
    }
}
