# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

def default_pods
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'    
    pod 'RxDataSources', '~> 1.0'
    pod 'Kingfisher', '~> 4.0'
    pod 'Moya-ModelMapper/RxSwift', '~> 4.1.0'
    pod 'RxOptional'
    pod 'AlamofireImage', '~> 3.3'
end 

target 'RxSamples' do
  default_pods

  target 'RxSamplesTests' do
    inherit! :search_paths
    # Pods for testing
default_pods
  end

  target 'RxSamplesUITests' do
    inherit! :search_paths
    # Pods for testing
default_pods
  end

end


post_install do |installer|
    installer.pods_project.targets.each do |target|
        target.build_configurations.each do |config|
            config.build_settings['ENABLE_TESTABILITY'] = 'YES'
            config.build_settings['SWIFT_VERSION'] = '3.0'
        end
    end
end
