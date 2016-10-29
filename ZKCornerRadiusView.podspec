
Pod::Spec.new do |s|
  s.name         = "ZKCornerRadiusView"
  s.version      = "0.0.3"
  s.summary      = "A subclass of UIImageView to avoid offscreen-rendering."
  s.description  = <<-DESC
                   A subclass of UIImageView to avoid offscreen-rendering.
                   DESC
  s.homepage     = "https://github.com/superk589/ZKCornerRadiusView"
  s.license      = "MIT"
  s.author             = { "zhenkai zhao" => "superk589@gmail.com" }
  s.platform     = :ios, "8.0"
  s.source       = { :git => "https://github.com/superk589/ZKCornerRadiusView.git", :tag => "#{s.version}" }
  s.source_files  = "ZKCornerRadiusView/ZKCornerRadiusView.swift"
  s.framework  = "UIKit"
end
