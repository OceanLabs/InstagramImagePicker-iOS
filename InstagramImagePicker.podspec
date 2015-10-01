Pod::Spec.new do |s|
  s.name         = 'InstagramImagePicker'
  s.version      = '1.1.3'
  s.license      = 'MIT'
  s.summary      = 'An image/photo picker for Instagram photos modelled after UIImagePickerController'
  s.author       = { "Deon Botha" => "deon@oceanlabs.co" }
  s.social_media_url = 'https://twitter.com/dbotha'
  s.homepage     = 'https://github.com/OceanLabs/InstagramImagePicker-iOS'
  s.platform     = :ios, '7.0'
  s.requires_arc = true
  s.source = {
    :git => 'https://github.com/OceanLabs/InstagramImagePicker-iOS.git',
    :tag => s.version.to_s
  }
  s.source_files = ['InstagramImagePicker/InstagramImagePicker/OL*.{h,m}', 'InstagramImagePicker/InstagramImagePicker/UIImageView+InstagramFadeIn.{h,m}']
  s.resources = ['InstagramImagePicker/InstagramImagePicker/InstagramImagePicker.xcassets', 'InstagramImagePicker/InstagramImagePicker/*.xib']
  s.dependency 'NXOAuth2Client', '~> 1.2.8'
  s.dependency 'SDWebImage', '~> 3.7.2'
  s.dependency 'UIColor-HexString'
end
