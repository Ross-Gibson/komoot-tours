# komoot-tours
An application to explore the Komoot API



# Build dependencies

Prior to building please download and install the below build dependencies:

- [Xcode 10](https://developer.apple.com/xcode/)
- [CocoaPods](https://cocoapods.org)



# How to build the app

1. Clone or download this repo
2. *cd* into the project root directory
`cd komoot-tours`
3. Install the project dependencies with CocoaPods
`pod install`
4. Open the Workspace in Xcode
`open tours.xcworkspace`
5. Open the file `ViewControllerFactory.swift` and at line 17 add your Auth Token
6. Open the file `DiscoverViewModel.swift` and at line 56 add your User ID
7. Build and run the app from Xcode using the iPhone Simulator

![](charles.png)



# How to find your Auth Token an User ID

1. Download the [Komoot app](https://www.komoot.com) from the App Store
2. Download and configure [Charles Proxy](https://www.charlesproxy.com) on your Mac
3. Configure your iPhone to use Charles. For details on how to set this up, read [this post](https://www.charlesproxy.com/documentation/faqs/using-charles-from-an-iphone/).
4. Open Charles on your Mac
5. Open the Komoot app on your iPhone and navigate to the Profile tab
6. In Charles, expand the list of requests and look for `https://api.komoot.de`
7. Select one of the requests, and copy the Auth Token from the `Authorization` param. You only need the bit starting after "Basic".
8. Look at the GET request. The part after `/v007/users/` is your user ID


# Project dependencies

The project dependencies are managed using CocoaPods.

- [SwiftyJSON](https://github.com/SwiftyJSON/SwiftyJSON)
