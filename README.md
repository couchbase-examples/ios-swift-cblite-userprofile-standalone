# Quickstart in Couchbase Lite with Swift and UIKit 
#### Build an iOS App in Swift with Couchbase Lite 

> This repo is designed to show you an app that allows users to log in and make changes to their user profile information.  User profile information is persisted as a Document in the local Couchbase Lite Database. When the user logs out and logs back in again, the profile information is loaded from the Database. 

Full documentation can be found on the [Couchbase Developer Portal](https://developer.couchbase.com/tutorial-quickstart-ios-uikit-basic).


## Prerequisites
To run this prebuilt project, you will need:

- Mac running MacOS 11 or 12 
- [Xcode 12/13](https://apps.apple.com/us/app/xcode/id497799835?mt=12)

### Installing Couchbase Lite Framework

The [Couchbase Documentation](https://docs.couchbase.com/couchbase-lite/3.0/swift/gs-install.html) has examples on how to add Couchbase Lite via
- Swift Package Manager
- Cocoa Pods
- Carthage
- Direct Download

## App Architecture

The sample app follows the [MVP pattern](https://en.wikipedia.org/wiki/Model%E2%80%93view%E2%80%93presenter), separating the internal data model, from a passive view through a presenter that handles the logic of our application and acts as the conduit between the model and the view

## Try it out

* Open `src/UserProfileDemo.xcodeproj` using Xcode
* Build and run the project.
* Verify that you see the login screen.

## Conclusion

Setting up a basic iOS app in Swift with Couchbase Lite is fairly simple, this project when run will allow a user to login, update a user profile, and save the information into the embedded database.
