Pod::Spec.new do |s|
s.name             = "SWFoundation"
s.version          = "1.0.0"
s.summary          = "Foundation extensions"
s.homepage         = "https://github.com/547/SWFoundation"
s.license          = 'MIT'
s.author           = { "547" => "timer_sevenwang@163.com" }
s.source           = { :git => "https://github.com/547/SWFoundation.git", :tag => s.version.to_s }

s.requires_arc          = true

s.source_files = 'SWFoundation/SWFoundation/**/*.swift'

s.ios.deployment_target = '8.0'
end
