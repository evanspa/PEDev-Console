Pod::Spec.new do |s|
  s.name         = "PEDev-Console"
  s.version      = "1.0.0"
  s.license      = "MIT"
  s.summary      = "An iOS static library to aid in the development of iOS apps."
  s.author       = { "Paul Evans" => "evansp2@gmail.com" }
  s.homepage     = "https://github.com/evanspa/#{s.name}"
  s.source       = { :git => "https://github.com/evanspa/#{s.name}.git", :tag => "#{s.name}-v#{s.version}" }
  s.platform     = :ios, '8.1'
  s.source_files = '**/*.{h,m}'
  s.public_header_files = '**/*.h'
  s.exclude_files = "**/*Tests/*.*", "**/DemoApp/*"
  s.requires_arc = true
  s.resource = "Resources/#{s.name}.bundle"
  s.dependency 'PEObjc-Commons'
  s.dependency 'PESimu-Select'
end
