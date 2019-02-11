# Uncomment the next line to define a global platform for your project
platform :ios, '11.0'

def rx_swift
  pod 'RxSwift', '~> 4.0'
end

def rx_cocoa
  pod 'RxCocoa', '~> 4.0'
end

def networking_pods
  pod 'RxAlamofire'
end

def test_pods
  pod 'RxBlocking', '~> 4.0'
  pod 'RxTest',     '~> 4.0'
end

target '20190111-RobertRozenvasser-NYCSchools' do
  use_frameworks!

  rx_swift
  rx_cocoa

  target '20190111-RobertRozenvasser-NYCSchoolsTests' do
    inherit! :search_paths
    test_pods
  end

end

target 'Domain' do
  use_frameworks!
  
  rx_swift
  rx_cocoa

end

target 'Library' do
  use_frameworks!

  rx_swift
  rx_cocoa
  networking_pods
  pod 'RxOptional'

  target 'LibraryTests' do
    inherit! :search_paths
    test_pods
  end

end