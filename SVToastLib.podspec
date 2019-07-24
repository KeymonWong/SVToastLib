#
# Be sure to run `pod lib lint SVToastLib.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'SVToastLib'
  s.version          = '0.1.0'
  s.summary          = '基于修改 SVProgressHUD 源码之后的 toast 弹窗'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
                        对 SVProgressHUD 源码做如下修改：
                        1. 新添加了 hud 的水平布局方式；
                        2. 新增加了可以修改菊花大小的属性；
                        3. 新增加了因单利造成的弹窗不一致的解决方法——重置配置。
                        
                        基于修改后的源码，新建一个管理 toast 的类。
                       DESC

  s.homepage         = 'https://www.baidu.com'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'KeymonWong' => 'hqm_vip@163.com' }
  s.source           = { :git => 'https://github.com/KeymonWong/SVToastLib.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '9.0'

  s.source_files = 'SVToastLib/SVToastLib/*.{h,m}', 'SVToastLib/SVToastLib/SVProgressHUD/*.{h,m}'
  s.resources = 'SVToastLib/SVToastLib/SVProgressHUD/*.{bundle}'

#  s.subspec 'SVProgressHUD' do |ss|
#    ss.source_files = 'SVToastLib/SV{Indefinite,Progress}AnimatedView.{h,m}', 'SVToastLib/SVProgressHUD.{h,m}', 'SVToastLib/SVRadialGradientLayer.{h,m}'
#    ss.resources = 'SVToastLib/SVProgressHUD.bundle'
#  end

  #s.resource_bundles = {
  #  'SVToastLib' => ['SVToastLib/SVProgressHUD.bundle/*.png']
  #}

  # s.frameworks = 'UIKit', 'Foundation'
  # s.public_header_files = 'Pod/Classes/**/*.h'
  # s.frameworks = 'UIKit', 'MapKit'
  # s.dependency 'AFNetworking', '~> 2.3'
end
