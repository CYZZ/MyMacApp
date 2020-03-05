# Uncomment the next line to define a global platform for your project
# platform :ios, '9.0'

#platform :ios, '9.0'
def common_pods
	use_frameworks!
	 pod 'Alamofire', '~> 5.0.0-rc.2'
	 pod 'SnapKit', '~>5.0.1'
	 pod 'Kingfisher'
	 pod 'HandyJSON'
end

target 'MyMacApp' do
  # Comment the next line if you don't want to use dynamic frameworks
#  use_frameworks!
#	pod 'Alamofire', '~> 5.0.0-rc.2'
#	pod 'SnapKit', '~>5.0.1'
#	pod 'Kingfisher'
#	pod 'HandyJSON'
  # Pods for MyMacApp
	common_pods
end

target 'MyIPhoneApp' do
  common_pods
end
