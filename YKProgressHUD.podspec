#
# Be sure to run `pod lib lint YKProgressHUD.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'YKProgressHUD'
  s.version          = '1.0.2'
  s.summary          = 'App容易使用的HUD'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
YKProgressHUD 是一个在 iOS App 上极易于使用的 HUD。主要用于显示加载、进度、情景信息、Toast。
                       DESC

  s.homepage         = 'https://github.com/tukzi/YKProgressHUD'

  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'hesong_ios@163.com' => 'hesong_ios@163.com' }
  s.source           = { :git => 'https://github.com/tukzi/YKProgressHUD', :tag => s.version.to_s }


  s.ios.deployment_target = '8.0'

  s.source_files = 'YKProgressHUD/*.swift'
  s.resources = 'YKProgressHUD/YKProgressHUD.bundle'
  s.requires_arc = true
  s.swift_version = '5.0'
  s.pod_target_xcconfig = { 'SWIFT_VERSION' => '5.0' }
  
end
