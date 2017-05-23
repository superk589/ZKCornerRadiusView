//
//  ZKCornerRadius.swift
//  ZKCornerRadius
//
//  Created by zzk on 2016/10/24.
//  Copyright © 2016年 zzk. All rights reserved.
//

import UIKit

open class ZKCornerRadiusView: UIImageView {
    
    private var usingCustomImage = false
    open override var image: UIImage? {
        set {
            usingCustomImage = true
            super.image = makeRoundedRectImage(newValue)
        }
        get {
            return super.image
        }
    }
    
    private func makeRoundedRectImage(_ image: UIImage?) -> UIImage? {
        
        let size = self.bounds.size
        let rect = self.bounds
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        defer {
            UIGraphicsEndImageContext()
        }
        
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
        
        if usingCustomImage {
            image?.draw(in: rect)
        }
        
        // 绘制边框
        zk.borderColor.set()
        cornerPath.lineWidth = zk.borderWidth
        cornerPath.stroke()
        
        // 生成新图片
        return UIGraphicsGetImageFromCurrentImageContext()
        
    }
    
    public struct Attribute {
        public var cornerRadius: CGFloat = 0
        public var borderWidth: CGFloat = 0
        public var borderColor: UIColor = UIColor.clear
        public var backgroundColor: UIColor = UIColor.clear
    }
    
    open var zk: Attribute = Attribute()
    
    open func render() {
        super.image = makeRoundedRectImage(image)
    }

}
