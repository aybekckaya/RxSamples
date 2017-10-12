# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

use_frameworks!

def default_pods
    pod 'RxSwift',    '~> 3.0'
    pod 'RxCocoa',    '~> 3.0'    
    pod 'RxDataSources', '~> 1.0'
    pod 'Kingfisher', '~> 4.0'
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
