//
//  ViewController.swift
//  Example
//
//  Created by zzk on 08/09/2017.
//  Copyright © 2017 zzk. All rights reserved.
//

import UIKit
import ZKCornerRadiusView

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let aView = ZKCornerRadiusView()
        aView.frame = CGRect.init(x: 150, y: 200, width: 200, height: 200)
        view.addSubview(aView)
        aView.zk.cornerRadius = 24
        aView.zk.backgroundColor = UIColor.yellow
        aView.zk.borderColor = UIColor.blue
        aView.zk.borderWidth = 4
        
        // 如果只想要一张纯色带边框的图片 可以单独调用此方法
        aView.render()
        
        aView.zk.backgroundColor = UIColor.blue
        //        aView.render()
        // 当设置了image之后 会自动根据之前设置好的各项属性切图
        aView.image = #imageLiteral(resourceName: "icon.png")
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}

