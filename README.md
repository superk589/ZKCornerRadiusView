# ZKCornerRadiusView
![Swift3](https://img.shields.io/badge/Swift-3.0-orange.svg?style=flat")
[![Version](https://img.shields.io/cocoapods/v/ZKCornerRadiusView.svg?style=flat)](http://cocoapods.org/pods/ZKCornerRadiusView)
[![License](https://img.shields.io/cocoapods/l/ZKCornerRadiusView.svg?style=flat)](http://cocoapods.org/pods/ZKCornerRadiusView)
[![Platform](https://img.shields.io/cocoapods/p/ZKCornerRadiusView.svg?style=flat)](http://cocoapods.org/pods/ZKCornerRadiusView)  

A subclass of UIImageView to avoid offscreen-rendering when setting cornerRadius

## CocoaPods:
```
platform :ios, '8.0'
use_frameworks!
target 'myApp' do
  pod 'ZKCornerRadiusView'
end
```

## Usage
```swift
let view = ZKCornerRadiusView()
view.zk_backgroundColor = UIColor.yellow
view.zk_borderColor = UIColor.blue
view.zk_borderWidth = 4

// if only want a one color image(with border maybe), use this method manually.
// view.zk_render()

// when set image to the view, all the attributes set above will work.
view.image = UIImage.init(named: imageName)
```
