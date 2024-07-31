#
# Be sure to run `pod lib lint WitnessGraph.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see https://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'WitnessGraph'
  s.version          = '0.0.1-alpha.1'
  s.summary          = 'A short description of WitnessGraph.'

# This description is used to generate tags and improve search results.
#   * Think: What does it do? Why did you write it? What is the focus?
#   * Try to keep it short, snappy and to the point.
#   * Write the description between the DESC delimiters below.
#   * Finally, don't worry about the indent, CocoaPods strips it!

  s.description      = <<-DESC
TODO: Add long description of the pod here.
                       DESC

  s.homepage         = 'https://github.com/iden3/WitnessGraph'
  # s.screenshots     = 'www.example.com/screenshots_1', 'www.example.com/screenshots_2'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Yaroslav Moria' => '5eeman@users.noreply.github.com' }
  s.source           = { :git => 'https://github.com/Yaroslav Moria/WitnessGraph.git', :tag => s.version.to_s }
  # s.social_media_url = 'https://twitter.com/<TWITTER_USERNAME>'

  s.ios.deployment_target = '12.0'

  s.swift_versions = ['5']

  s.pod_target_xcconfig = {
    'ONLY_ACTIVE_ARCH' => 'YES',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }
  s.user_target_xcconfig = {
    'ONLY_ACTIVE_ARCH' => 'YES',
    'CLANG_ALLOW_NON_MODULAR_INCLUDES_IN_FRAMEWORK_MODULES' => 'YES'
  }

  s.subspec 'C' do |c|
    c.source_files = 'Sources/C/**/*'
    c.vendored_frameworks = "Libs/libwitness.xcframework"
    c.ios.vendored_frameworks = "Libs/libwitness.xcframework"
  end

  s.subspec 'WitnessGraph' do |witnessGraph|
    witnessGraph.source_files = 'Sources/WitnessGraph/**/*'
    witnessGraph.dependency 'WitnessGraph/C'
    witnessGraph.ios.dependency 'WitnessGraph/C'
  end

  s.default_subspec = 'WitnessGraph'
end
