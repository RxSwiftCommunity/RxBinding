#
# Be sure to run `pod lib lint RxBinding.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'RxBinding'
  s.version          = '0.5'
  s.summary          = 'Simple data binding operators for RxSwift.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
RxBinding provodes '~>', '<~>' and '~' operators for data binding using RxSwift.
                       DESC

  s.homepage         = 'https://github.com/RxSwiftCommunity/RxBinding'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'lm2343635' => 'lm2343635@126.com' }
  s.source           = { :git => 'https://github.com/RxSwiftCommunity/RxBinding.git', :tag => s.version.to_s }
  s.social_media_url = 'https://fczm.site'

  s.ios.deployment_target = '10.0'
  s.swift_version = '5.1'

  s.source_files = 'Sources/RxBinding/**/*'
  
  s.dependency 'RxSwift', '~> 6'
  s.dependency 'RxCocoa', '~> 6'
end
