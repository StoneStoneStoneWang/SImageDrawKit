
Pod::Spec.new do |s|

s.name         = "SImageDrawKit"
s.version      = "0.0.1"
s.summary      = "A Lib For draw image."
s.description  = <<-DESC
SImageDrawKit是一个工具类 draw image。
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/SImageDrawKit"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.requires_arc = true

s.frameworks = 'UIKit', 'Foundation'

s.source = { :git => "https://github.com/StoneStoneStoneWang/SImageDrawKit.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{h,m}"

s.dependency 'SToolsKit'

end


