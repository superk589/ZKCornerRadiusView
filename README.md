# ZKCornerRadiusView
A subclass of UIImageView to avoid offscreen-rendering

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
view.zk_cornerRadius = 10
view.image = UIImage.init(named: imageName)
```
