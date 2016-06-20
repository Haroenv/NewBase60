Pod::Spec.new do |s|

  s.name             = "NewBase60"
  s.version          = "0.2.0"
  s.license          = "MIT"
  s.summary          = "A port of Tantek Çelik's NewBase60 in Swift"
  s.homepage         = "https://github.com/Haroenv/NewBase60"
  s.author           = "Haroen Viaene"
  s.source           = { :git => "https://github.com/Haroenv/NewBase60.git", :tag => "v#{s.version}" }

  s.platform = :ios, :osx

  s.ios.deployment_target = '7.0'
  s.osx.deployment_target = '10.9'

  s.framework = 'XCTest'
  s.source_files = "NewBase60/**/*.swift"
end
