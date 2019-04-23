# Uncomment the next line to define a global platform for your project
platform :ios, '12.0'

target 'spendsterIOS' do
  # Comment the next line if you're not using Swift and don't want to use dynamic frameworks
  use_frameworks!
    pod 'RxSwift',    '~> 4.0'
    pod 'RxCocoa',    '~> 4.0'
    pod 'SwiftLint'
    pod 'Parchment'
    pod 'Alamofire'
    pod 'SwiftyJSON', '~> 4.0'
  # Pods for spendsterIOS

  target 'spendsterIOSTests' do
    inherit! :search_paths
    # Pods for testing
  end
  
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    target.build_configurations.each do |config|
      config.build_settings['SWIFT_VERSION'] = '4.2'
    end
  end
end
