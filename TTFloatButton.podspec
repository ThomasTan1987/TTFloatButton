#
# Be sure to run `pod lib lint TTFloatButton.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'TTFloatButton'
  s.version          = '0.1.1'
  s.summary          = '一个简单的悬浮按钮.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
继承自window，通过设置windowLevel，保持悬浮按钮始终在key window上面
                       DESC

  s.homepage         = 'https://github.com/ThomasTan1987/TTFloatButton'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'ThoamsTan' => 'thomastan@vipabc.com' }
  s.source           = { :git => 'https://github.com/ThomasTan1987/TTFloatButton.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '8.0'

  s.source_files = 'Classes/**/*'

  # s.resource_bundles = {
  #   'TTFloatButton' => ['TTFloatButton/Assets/*.png']
  # }

  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
