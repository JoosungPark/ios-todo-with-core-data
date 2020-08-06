platform :ios, '11.0'

workspace 'Todo'

def todo_shared
  pod 'Alamofire', '~> 5.2.1'
  pod 'RxAlamofire', '~> 5.3.1'
  pod 'RxSwift', '~> 5.1.1'
  pod 'RxSwiftExt', '~> 5.2.0'
  pod 'RxCocoa', '~> 5.1.1'
  pod 'RxOptional', '~> 4.1.0'
  pod 'RxBlocking', '~> 5.1.1'
  pod 'ObjectMapper', '~> 4.2.0'
  pod 'RxGesture', '~> 3.0.2'
  pod 'RxDataSources', '~> 4.0.1'
  pod 'Action', '~> 4.1.0'
end

def todo_test_pods
  pod 'Quick'
  pod 'Nimble'
  pod 'RxBlocking', '~> 5.1.1'
  pod 'RxTest', '~> 5.1.1'
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
  end
end

