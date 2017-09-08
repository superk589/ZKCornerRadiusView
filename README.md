# ZKCornerRadiusView
![Swift4](https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat)
[![Version](https://img.shields.io/cocoapods/v/ZKCornerRadiusView.svg?style=flat)](http://cocoapods.org/pods/ZKCornerRadiusView)
[![License](https://img.shields.io/cocoapods/l/ZKCornerRadiusView.svg?style=flat)](http://cocoapods.org/pods/ZKCornerRadiusView)
[![Platform](https://img.shields.io/cocoapods/p/ZKCornerRadiusView.svg?style=flat)](http://cocoapods.org/pods/ZKCornerRadiusView)  

A subclass of UIImageView to avoid offscreen-rendering when setting cornerRadius

## Installation

### CocoaPods:

[CocoaPods](http://cocoapods.org) is a dependency manager for Cocoa projects. You can install it with the following command:

```bash
$ gem install cocoapods
```
To integrate ZKPageViewController into your Xcode project using CocoaPods, specify it in your `Podfile`:

```ruby
source 'https://github.com/superk589/ZKCornerRadiusView.git'
platform :ios, '8.0'
use_frameworks!

target 'YourApp' do
    pod 'ZKCornerRadiusView'
end
```

Then, run the following command:

```bash
$ pod install
```

### Carthage

[Carthage](https://github.com/Carthage/Carthage) is a decentralized dependency manager that builds your dependencies and provides you with binary frameworks.

You can install Carthage with [Homebrew](http://brew.sh/) using the following command:

```bash
$ brew update
$ brew install carthage
```

To integrate ZKPageViewController into your Xcode project using Carthage, specify it in your `Cartfile`:

```ogdl
github "superk589/ZKCornerRadiusView"
```

Run `carthage update` to build the framework and drag the built `ZKCornerRadiusView.framework` into your Xcode project.

### Manually

If you prefer not to use either of the aforementioned dependency managers, you can integrate ZKCornerRadiusView into your project manually.

## Usage
```swift
let view = ZKCornerRadiusView()
view.zk.backgroundColor = UIColor.yellow
view.zk.borderColor = UIColor.blue
view.zk.borderWidth = 4
view.zk.cornerRadius = 6

// if only want a one color image(with border maybe), use this method manually.
// view.render()

// when set image to the view, all the attributes set above will work.
view.image = UIImage.init(named: imageName)
```
