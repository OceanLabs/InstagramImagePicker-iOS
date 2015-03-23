Pod::Spec.new do |s|
  s.name         = 'InstagramImagePicker'
  s.version      = '1.0.5'
  s.license      = 'MIT'
  s.summary      = 'Ocean Labs InstagramImagePicker'
  s.author       = { "Deon Botha" => "deon@oceanlabs.co" }
  s.social_media_url = 'https://twitter.com/dbotha'
  s.homepage     = 'https://github.com/OceanLabs/InstagramImagePicker-iOS'
  s.platform     = :ios, '6.0'
  s.requires_arc = true
  s.source = {
    :git => 'https://github.com/OceanLabs/InstagramImagePicker-iOS.git',
    :tag => '1.0.5'
  }
  s.source_files = ['InstagramImagePicker/OL*.{h,m}', 'InstagramImagePicker/UIImageView+InstagramFadeIn.{h,m}']
  s.resources = ['InstagramImagePicker/InstagramImagePicker.xcassets', 'InstagramImagePicker/*.xib']
  s.dependency 'NXOAuth2Client', '~> 1.2.8'
  s.dependency 'SDWebImage', '~> 3.7.2'
  s.dependency 'UIColor-HexString'
end
