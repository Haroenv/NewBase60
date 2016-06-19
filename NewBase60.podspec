Pod::Spec.new do |s|

  s.name             = "NewBase60"
  s.version          = "0.1.0"
  s.license          = "MIT"
  s.summary          = "A short description"
  s.homepage         = "https://github.com/Haroenv/NewBase60"
  s.author           = "Haroen Viaene"
  s.source           = { :git => "https://github.com/Haroenv/NewBase60.git", :tag => "v#{s.version}" }

  s.source_files = "NewBase60/**/*.swift"
end
