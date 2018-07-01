#
#  Be sure to run `pod spec lint DPNetworking.podspec' to ensure this is a
#  valid spec and to remove all comments including this before submitting the spec.
#
#  To learn more about Podspec attributes see http://docs.cocoapods.org/specification.html
#  To see working Podspecs in the CocoaPods repo see https://github.com/CocoaPods/Specs/
#

Pod::Spec.new do |s|

  # ―――  Spec Metadata  ―――――――――――――――――――――――――――――――――――――――――――――――――――――――――― #
  #
  #  These will help people to find your library, and whilst it
  #  can feel like a chore to fill in it's definitely to your advantage. The
  #  summary should be tweet-length, and the description more in depth.
  #

  s.name         = "DPNetworking"
  s.version      = "0.0.3"
  s.summary      = "对AFNetworking做的二次封装，一句代码发起网络请求。"

  # This description is used to generate tags and improve search results.
  #   * Think: What does it do? Why did you write it? What is the focus?
  #   * Try to keep it short, snappy and to the point.
  #   * Write the description between the DESC delimiters below.
  #   * Finally, don't worry about the indent, CocoaPods strips it!
  s.description  = <<-DESC
  对AFNetworking做的二次封装，一句代码发起网络请求。 
  DESC

  s.homepage     = "https://github.com/DaoPinWong/DPNetworking"
  # s.screenshots  = "www.example.com/screenshots_1.gif", "www.example.com/screenshots_2.gif"
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'dpwong' => '413655409@qq.com' }
  s.source           = { :git => 'https://github.com/DaoPinWong/DPNetworking.git', :tag => s.version.to_s }

  s.ios.deployment_target = '8.0'
  s.source_files = 'DPNetworking/Classes/*.{h,m}'
  s.dependency 'AFNetworking'

end
