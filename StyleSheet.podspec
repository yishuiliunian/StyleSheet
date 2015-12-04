#
# Be sure to run `pod lib lint StyleSheet.podspec' to ensure this is a
# valid spec and remove all comments before submitting the spec.
#
# Any lines starting with a # are optional, but encouraged
#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = "StyleSheet"
  s.version          = "0.1.2"
  s.summary          = "在IOS基础空间所能够支持的样式基础之上，建立的类似于样式配置表css的模块。为每个控件制定一个style，可以用来控制该控件的样式，同时样式可以在多个控件之间复用。"
  s.description      = <<-DESC
                       在IOS基础控件所能够支持的样式基础之上，建立的类似于样式配置表css的模块。为每个控件制定一个style，可以用来控制该控件的样式，同时样式可以在多个控件之间复用。
                       DESC
  s.homepage         = "https://github.com/yishuiliunian/StyleSheet"
  # s.screenshots     = "www.example.com/screenshots_1", "www.example.com/screenshots_2"
  s.license          = 'MIT'
  s.author           = { "dongzhao" => "yishuiliunian@gmail.com" }
  s.source           = { :git => "https://github.com/yishuiliunian/StyleSheet.git", :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.platform     = :ios, '7.0'
  s.requires_arc = true

  s.source_files = 'Pod/Classes/**/*'
  s.resource_bundles = {
    'StyleSheet' => ['Pod/Assets/*.png']
  }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
