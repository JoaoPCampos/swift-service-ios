Pod::Spec.new do |spec|

spec.name                   = "SwiftService"
spec.version                = "1.0.0"
spec.summary                = "Swift Service is a helper tool for network requests"

spec.homepage               = "https://github.com/JoaoPCampos"
spec.license                = { :type => "MIT", :file => "LICENSE" }
spec.author                 = { "Joao Campos" => "jonybfc@gmail.com" }

spec.ios.deployment_target  = "12.2"
spec.swift_version          = "5.0"
spec.ios.framework          = 'UIKit'
spec.platform               = :ios, "12.2"

spec.source                 = { :git => "git@github.com:JoaoPCampos/swift-service-ios.git", :tag => "#{spec.version}" }
spec.source_files           = "SwiftService/Source/**/*.{h,m,swift}"

end
