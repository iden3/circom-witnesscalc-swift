Pod::Spec.new do |s|
  s.name             = 'CircomWitnesscalc'
  s.version          = '0.0.1-alpha.3'
  s.summary          = 'CircomWitnesscalc is a library to calculate witness files.'
  s.description      = <<-DESC
CircomWitnesscalc is a library to calculate witness files for zero knowledge proofs, written in Rust.
It accepts inputs and graph file .wcd for specific circuit to calculate witness file.
                       DESC
  s.homepage         = 'https://github.com/iden3/circom-witnesscalc-swift'
  s.license          = { :type => 'MIT & Apache License, Version 2.0', :file => 'LICENSE-APACHE.txt' }
  s.author           = { 'Iden3' => 'hello@iden3.io' }
  s.source           = { :git => 'https://github.com/iden3/circom-witnesscalc-swift.git', :tag => s.version.to_s }

  s.ios.deployment_target = '12.0'
  s.osx.deployment_target = '10.14'

  s.swift_versions = ['5']

  s.pod_target_xcconfig = {
    'ONLY_ACTIVE_ARCH' => 'YES',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
  s.user_target_xcconfig = {
    'ONLY_ACTIVE_ARCH' => 'YES',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  s.subspec 'сircomWitnesscalcС' do |c|
    c.source_files = 'Sources/сircomWitnesscalcС/**/*'
    c.public_header_files = 'Sources/сircomWitnesscalcС/include/*.h'
    c.vendored_frameworks = "Libs/libcircom_witnesscalc.xcframework"
  end

  s.subspec 'CircomWitnesscalc' do |circomWitnesscalc|
    circomWitnesscalc.source_files = 'Sources/CircomWitnesscalc/**/*'
    circomWitnesscalc.dependency 'CircomWitnesscalc/сircomWitnesscalcС'
  end

  s.default_subspec = 'CircomWitnesscalc'
end
