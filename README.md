# Sample Swift App and Tutorials for Mobile Center
[Visual Studio Mobile Center](https://www.visualstudio.com/vs/mobile-center) brings together multiple services, commonly used by mobile developers, into a single, integrated product.

This sample Swift app and its collection of tutorials is designed to help you quickly and easily onboard to Mobile Center for iOS.

## This repository
This sample Swift app has the Mobile Center SDK already integrated - all you need to do is follow the tutorials at the bottom to learn how to use each service.

## Build the sample app
After forking the repository, you'll need to install CocoaPods to build the app.
  ```shell
  sudo gem install cocoapods
  ```
Next, install the dependencies.
  ```shell
  pod install
  ```
Open the .xcworkspace. The app can now build and run. You can learn to use the sample app with Mobile Center with the tutorials below.

## Codesigning
_Codesigning is optional, but recommended._

Codesigning will allow you to deploy this sample app to your device. The **Build**, **Distribute**, and **Push** tutorials recommend that you codesign.

When creating a new App ID for this sample app, be sure to check the **Push Notifications** service under the **App Services** section.

To sign the app in Xcode:
1. Open **.xcworkspace** from the sample app's folder.
2. Go to **General** within the .xcworkspace file.
3. Under **Identity**, edit the **Bundle Identifier** to match the app ID.
4. Import and select the provisioning profile under **Signing (Debug)** and **Signing (Release)**.

## Tutorial links
Begin with the **Getting Started** tutorial. After you've completed that, you can do the rest in the order below, or choose a specific tutorial to follow.

## Contents
| Tutorial | Description |
|:-|:-|
| Getting Started | Set up the app |
| Build | Build the app |
| Test | Run automated UI tests |
| Distribute| Distribute to a user's device |
| Crash | Monitor application crashes |
| Analytics | View user analytics |
| Push | Send users push notifications |

