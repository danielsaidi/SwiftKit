# Run `pod lib lint DSSwiftKit.podspec' to ensure this is a valid spec.

Pod::Spec.new do |s|
  s.name             = 'DSSwiftKit'
  s.version          = '1.4.0'
  s.swift_versions   = ['5.3']
  s.summary          = 'SwiftKit contains extra functionality for Swift.'

  s.description      = <<-DESC
  SwiftKit contains extra functionality for Swift, like extensions, utils etc.
                       DESC

  s.homepage         = 'https://github.com/danielsaidi/SwiftKit'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Daniel Saidi' => 'daniel.saidi@gmail.com' }
  s.source           = { :git => 'https://github.com/danielsaidi/SwiftKit.git', :tag => s.version.to_s }
  s.social_media_url = 'https://twitter.com/danielsaidi'

  s.swift_version = '5.6'
  s.ios.deployment_target = '13.0'
  s.macos.deployment_target = '11.0'
  s.tvos.deployment_target = '13.0'
  s.watchos.deployment_target = '6.0'
  
  s.source_files = 'Sources/**/*.swift'
end
