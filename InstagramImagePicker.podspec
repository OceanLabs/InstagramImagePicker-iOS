Pod::Spec.new do |s|
  s.name         = 'InstagramImagePicker'
  s.version      = '1.0.5'
  s.license      = 'MIT'
  s.summary      = 'Ocean Labs InstagramImagePicker'
  s.author       = { "Deon Botha" => "deon@oceanlabs.co" }
  s.homepage     = 'https://github.com/OceanLabs/InstagramImagePicker-iOS'
  s.platform     = :ios, '5.0'
  s.requires_arc = 'true'
  s.source = {
    :git => 'git@github.com:OceanLabs/InstagramImagePicker-iOS.git', :branch => 'sticky9'
  }
  s.source_files = 'InstagramImagePicker/OL*.{h,m}'
  s.resources = ['InstagramImagePicker/InstagramImagePicker.xcassets', 'InstagramImagePicker/*.xib']
  s.dependency 'NXOAuth2Client'
  s.dependency 'UIImageView+FadeIn'
  s.dependency 'UIDevice+Hardware'
  s.dependency 'UIColor-HexString'
  s.dependency 'NSURL+Query'
end
