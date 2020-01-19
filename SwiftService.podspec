Pod::Spec.new do |spec|

spec.name                   = "SwiftService"
spec.version                = "0.1.0"
spec.summary                = "Swift Service is a helper tool for network requests"

spec.homepage               = "https://github.com/JoaoPCampos"
spec.license                = { :type => "MIT", :file => "LICENSE" }
spec.author                 = { "Joao Campos" => "jonybfc@gmail.com" }

spec.ios.deployment_target  = "10.0"
spec.swift_version          = "5.1"
spec.ios.framework          = 'UIKit'
spec.platform               = :ios, "10.0"

spec.source                 = { :git => "git@github.com:JoaoPCampos/swift-service-ios.git", :tag => "#{spec.version}" }
spec.source_files           = "SwiftService/Source/**/*.{h,m,swift}"

end
