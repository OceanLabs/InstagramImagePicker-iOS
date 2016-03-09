# iOS Instagram Image Picker

A Instagram image picker providing a simple UI for a user to pick photos from a users Instagram account. It provides an image picker interface that matches the iOS SDK's UIImagePickerController.

It takes care of all authentication with Instagram as and when necessary. It will automatically renew auth tokens or prompt the user to re-authorize the app if needed.

## Video Preview

[![Preview](https://github.com/OceanLabs/InstagramImagePicker-iOS/raw/master/preview.png)](https://vimeo.com/135683505)

## Requirements

* Xcode 6 and iOS SDK 7
* iOS 7.0+ target deployment

## Installation
### CocoaPods

[CocoaPods](http://cocoapods.org) is a dependency manager for Objective-C, which automates and simplifies the process of using 3rd-party libraries like the Kite Print SDK in your projects. If you're using it just add the following to your Podfile:

```ruby
pod "InstagramImagePicker"
```

## Usage

You need to have set up your application correctly to work with Instagram by registering a new Instagram application here: https://instagram.com/developer/ . For the redirect uri use something like `your-app-scheme://instagram-callback`.

To launch the Instagram Image Picker:

```objective-c
#import <OLInstagramImagePickerController.h>

OLInstagramImagePickerController *imagePicker = [[OLInstagramImagePickerController alloc] initWithClientId:@"YOUR_CLIENT_ID" secret:@"YOUR_CLIENT_SECRET" redirectURI:@"YOUR-APP-SCHEME://instagram-callback"];
imagePicker.delegate = self;
[self presentViewController:imagePicker animated:YES completion:nil];
```

Implement the `OLInstagramImagePickerControllerDelegate` protocol:

```objective-c

- (void)instagramImagePicker:(OLInstagramImagePickerController *)imagePicker didFinishPickingImages:(NSArray/*<OLInstagramImage>*/ *)images {
    [self dismissViewControllerAnimated:YES completion:nil];
    // do something with the OLInstagramImage objects
}

- (void)instagramImagePickerDidCancelPickingImages:(OLInstagramImagePickerController *)imagePicker {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)instagramImagePicker:(OLInstagramImagePickerController *)imagePicker didFailWithError:(NSError *)error {
    [self dismissViewControllerAnimated:YES completion:nil];
    // do something sensible with the error
}

```

## App Transport Security
Xcode 7 and iOS 9 includes some new security features. In order to connect to Instagram you will need to add some more exceptions to your project's info plist file (in addition to the ones that your project might require).
We need to add forward secrecy exceptions for Instagram's CDNs. The following is what you need to copy your app's info plist, which includes anything that is needed by Kite as well:
```
	<key>NSAppTransportSecurity</key>
	<dict>
		<key>NSExceptionDomains</key>
		<dict>
			<key>akamaihd.net</key>
			<dict>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
			<key>facebook.net</key>
			<dict>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
      <key>facebook.com</key>
			<dict>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
			<key>instagram.com</key>
			<dict>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
			<key>fbcdn.net</key>
			<dict>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
			<key>cdninstagram.com</key>
			<dict>
				<key>NSExceptionRequiresForwardSecrecy</key>
				<false/>
				<key>NSIncludesSubdomains</key>
				<true/>
			</dict>
		</dict>
	</dict>
```

**Set maximum number of selections**

Limit the number of assets to be picked.
```` objective-c
- (BOOL)instagramImagePicker:(OLInstagramImagePickerController *)imagePicker shouldSelectImage:(OLInstagramImage *)image
{
    // Allow 10 assets to be picked
    return (imagePicker.selected.count < 10);
}
````

### Sample Apps
The project is bundled with a Sample App to highlight the libraries usage. Alternatively you can see the library in action in the following iOS apps:

* [Sticky 9](https://itunes.apple.com/us/app/sticky9-print-your-photos/id974671077?mt=8)
* [HuggleUp](https://itunes.apple.com/gb/app/huggleup-photo-printing-personalised/id977579943?mt=8)
* Get in touch to list your app here

## License
This project is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
