Pod::Spec.new do |s|

  version = `cat version.txt`.chomp

  s.name         = 'VSMobileCenterExtensions'
  s.version      = version
  s.license      = { :type => 'MIT' }
  s.homepage     = 'https://github.com/xamarinhq/test-cloud-xcuitest-extensions'
  s.authors      = { 'Chris Fuentes' => 'chfuen@microsoft.com' }
  s.summary      = 'Extension library to add value to XCUITests run in Xamarin Test Cloud/Visual Studio Mobile Center'
  s.source       = { :git => 'https://github.com/xamarinhq/test-cloud-xcuitest-extensions.git', :tag => version }
  s.source_files = 'VSMobileCenterExtensions/*.{h,m}'
  s.ios.framework    = 'XCTest'
  s.ios.deployment_target = '9.0'
  s.requires_arc = true
  s.pod_target_xcconfig = { 'ENABLE_BITCODE' => 'NO' }
end
