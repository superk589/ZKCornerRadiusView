//
//  ZKCornerRadius.swift
//  ZKCornerRadius
//
//  Created by zzk on 2016/10/24.
//  Copyright © 2016年 zzk. All rights reserved.
//

import UIKit

open class ZKCornerRadiusView: UIImageView {
    private var hasObserver = false
    private var roundedRectImage:UIImage? {
        didSet {
            self.image = roundedRectImage
        }
    }
    
    private func makeRoundedRectImage() -> UIImage? {
        
        defer {
            UIGraphicsEndImageContext()
        }
        
        let size = self.bounds.size
        let rect = self.bounds
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        
        guard let context = UIGraphicsGetCurrentContext() else {
            return nil
        }
        
        // 绘制背景部分
        let backgroundPath = UIBezierPath.init(roundedRect: rect, cornerRadius: zk.cornerRadius)
        zk.backgroundColor.set()
        backgroundPath.fill()
        
        // 渲染图片
        let cornerPath = UIBezierPath.init(roundedRect: rect, cornerRadius: zk.cornerRadius)
        cornerPath.addClip()
        context.addPath(cornerPath.cgPath)
        self.layer.render(in: context)
        
        // 绘制边框
        zk.borderColor.set()
        cornerPath.lineWidth = zk.borderWidth
        cornerPath.stroke()
        
        // 生成新图片
        if let newImage = UIGraphicsGetImageFromCurrentImageContext() {
            return newImage
        } else {
            return nil
        }
    }
    
    public struct Attribute {
        public var cornerRadius: CGFloat = 0
        public var borderWidth: CGFloat = 0
        public var borderColor: UIColor = UIColor.clear
        public var backgroundColor: UIColor = UIColor.clear
    }
    
    open var zk: Attribute = Attribute() {
        didSet {
            addObserver()
        }
    }
    
    open func render() {
        roundedRectImage = makeRoundedRectImage()
    }
    
    private func addObserver() {
        if !hasObserver {
            addObserver(self, forKeyPath: #keyPath(image), options: .new, context: nil)
            hasObserver = true
        }
        if self.image != nil {
            roundedRectImage = makeRoundedRectImage()
        }
    }
    
    override open func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if let image = change?[.newKey] as? UIImage {
            if roundedRectImage != image {
                roundedRectImage = makeRoundedRectImage()
            }
        }
    }
    
    deinit {
        if hasObserver {
            removeObserver(self, forKeyPath: #keyPath(image))
        }
    }
}
