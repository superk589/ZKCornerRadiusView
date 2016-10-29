//
//  ViewController.swift
//  ZKCornerRadiusView
//
//  Created by zzk on 2016/10/29.
//  Copyright © 2016年 zzk. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let zkview = ZKCornerRadiusView()
        zkview.frame = CGRect.init(x: 150, y: 200, width: 200, height: 200)
        view.addSubview(zkview)
        zkview.zk_cornerRadius = 24
        zkview.image = #imageLiteral(resourceName: "icon.png")
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

