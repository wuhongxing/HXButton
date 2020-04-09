//
//  ViewController.swift
//  HXButton
//
//  Created by wuhongxing on 04/08/2020.
//  Copyright (c) 2020 wuhongxing. All rights reserved.
//

import UIKit
import HXButton

class ViewController: UIViewController {
    
    var aview = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        view.addSubview(aview)
        aview
            .hx
            .frame(CGRect(x: 100, y: 100, width: 200, height: 200))
            .cornerType([.topLeft, .topRight])
            .cornerRadius(30)
            .backgroundColor(UIColor(0x134567))
            .backgroundColor(.orange, state: .highlighted)
            .backgroundColor(.red, state: .selected)
            .selectedTitle("测试")
            .image(#imageLiteral(resourceName: "tabbar_mainframeHL"))
            .title("321")
            .highlightedTitle("123")
            .borderColor(UIColor(0x134567))
            .layoutType(.contentCenterImageRight)
            .layout()
        
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        aview.isSelected = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
