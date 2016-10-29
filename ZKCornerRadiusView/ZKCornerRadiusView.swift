//
//  ZKCornerRadius.swift
//  ZKCornerRadius
//
//  Created by zzk on 2016/10/24.
//  Copyright © 2016年 zzk. All rights reserved.
//

import UIKit

class ZKCornerRadiusView: UIImageView {
    private var hasObserver = false
    private var roundedRectImage:UIImage? {
        didSet {
            self.image = roundedRectImage
        }
    }
    
    private func makeRoundedRectImage() -> UIImage? {
        let size = self.bounds.size
        let rect = CGRect.init(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        let context:CGContext! = UIGraphicsGetCurrentContext()
        if context == nil {
            return nil
        }
        let path = UIBezierPath.init(roundedRect: rect, cornerRadius: zk_cornerRadius)
        path.addClip()
        context.addPath(path.cgPath)
        self.layer.render(in: context)
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            return newImage
        }
        return nil
    }
    
    var zk_cornerRadius:CGFloat = 0 {
        didSet {
            if !hasObserver {
                addObserver(self, forKeyPath: "image", options: .new, context: nil)
                hasObserver = true
            }
            if self.image != nil {
                roundedRectImage = makeRoundedRectImage()
            }
        }
    }
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let image = change?[.newKey] as? UIImage {
            if roundedRectImage != image {
                roundedRectImage = makeRoundedRectImage()
            }
        }
    }
    deinit {
        if hasObserver {
            removeObserver(self, forKeyPath: "image")
        }
    }
}
