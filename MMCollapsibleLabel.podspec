#
# Be sure to run `pod lib lint MMCollapsibleLabel.podspec' to ensure this is a
# valid spec before submitting.
#
# Any lines starting with a # are optional, but their use is encouraged
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
#

Pod::Spec.new do |s|
  s.name             = 'MMCollapsibleLabel'
  s.version          = '0.1.0'
  s.summary          = 'A collapsible UILabel.'

  s.description      = <<-DESC
A highly customizable UILabel which is collapsible like an accordion with a Show / Hide button.
                       DESC

  s.homepage         = 'https://github.com/manicmaniac/MMCollapsibleLabel'
  s.license          = { :type => 'MIT', :file => 'LICENSE' }
  s.author           = { 'Ryosuke Ito' => 'rito.0305@gmail.com' }
  s.screenshot       = 'https://media.giphy.com/media/3oriOcw7Dx16LgUkq4/source.gif'
  s.source           = { :git => 'https://github.com/manicmaniac/MMCollapsibleLabel.git', :tag => s.version.to_s }
  s.deprecated       = true

  s.ios.deployment_target = '7.0'

  s.source_files = 'MMCollapsibleLabel/Classes/**/*'

  s.resource_bundles = {
    'MMCollapsibleLabel' => ['MMCollapsibleLabel/Assets/MMCollapsibleLabel.xib']
  }
end
