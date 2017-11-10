source 'https://msmobilecenter.visualstudio.com/SDK/_git/AppCenterSDK-Specs-Private'
source 'https://github.com/CocoaPods/Specs.git'

target 'sampleapp-ios-swift' do
  platform :ios, '9.0'
  use_frameworks!

  pod 'AppCenter' => '1.0.0-5'
  pod 'AppCenter/Push' => '1.0.0-5'
  
  target 'sampleapp-ios-swiftUITests' do
    inherit! :search_paths
    # Pods for testing
    pod 'VSMobileCenterExtensions'
  end

end
