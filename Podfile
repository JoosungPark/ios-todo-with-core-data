platform :ios, '11.0'

workspace 'Todo'

def todo_shared
  pod 'Alamofire', '~> 5.4'
  pod 'RxAlamofire', '~> 6.1'
  pod 'RxSwift', '~> 6.2.0'
  pod 'RxSwiftExt', '~> 6'
  pod 'RxCocoa', '~> 6.2.0'
  pod 'RxOptional', '~> 5'
  pod 'RxBlocking', '~> 6.2.0'
  pod 'RxGesture', '~> 4.0.2'
  pod 'RxDataSources', '~> 5.0'
  pod 'Action', '~> 4.3.0'
  pod 'ObjectMapper', '~> 4.2.0'
  pod "RxCoreData", "~> 1.0.1"
end

def todo_test_pods
  pod 'Quick'
  pod 'Nimble', '~> 9.2.0'
  pod 'RxBlocking', '~> 6.2.0'
  pod 'RxTest', '~> 6.2.0'
end

target 'Todo' do
  use_frameworks!
  inhibit_all_warnings!
  todo_shared
end

target 'TodoTests' do
  use_frameworks!
  inhibit_all_warnings!
  todo_test_pods
end

post_install do |installer|
  installer.pods_project.targets.each do |target|
    puts "#{target.name}"
    target.build_configurations.each do |config|
      config.build_settings['IPHONEOS_DEPLOYMENT_TARGET'] = '11.0'
    end
  end
end

