<p align="center">
    <img src ="Resources/Logo.png" width=500 />
</p>

<p align="center">
    <a href="https://github.com/danielsaidi/SwiftKit">
        <img src="https://badge.fury.io/gh/danielsaidi%2FSwiftKit.svg?style=flat" alt="Version" />
    </a>
    <img src="https://img.shields.io/badge/platform-SwiftUI-red.svg" alt="Swift UI" />
    <img src="https://img.shields.io/badge/Swift-5.3-orange.svg" alt="Swift 5.3" />
    <img src="https://badges.frapsoft.com/os/mit/mit.svg?style=flat&v=102" alt="License" />
    <a href="https://twitter.com/danielsaidi">
        <img src="https://img.shields.io/badge/contact-@danielsaidi-blue.svg?style=flat" alt="Twitter: @danielsaidi" />
    </a>
</p>


## About SwiftKit

`SwiftKit` adds functionality to `Swift`, both extensions to existing types and components, as well as custom useful functionality.

You can read more about the different parts of `SwiftKit` in separate readmes:

* [Authentication][Authentication]
* [Bundle][Bundle]
* [Coding][Coding]
* [Data][Data]
* [Date][Date]
* [Device][Device]
* [Extensions][Extensions]
* [Files][Files]
* [Geo][Geo]
* [IoC][IoC]
* [Keychain][Keychain]
* [Network][Network]

If things that exist in this library are added to `Swift`, the corresponding functionality in this library will be deprecated and refer to those new features.


## Demo App

This project contains a universal demo app that demonstrates most things from the library. 

To run the demo app, just open and run the `Demo.xcodeproj` project in the `Demo` folder. Make sure to pick the right target.

`IMPORTANT` The demo is universal and contains one app for iOS and one for macOS. For now, the macOS has navigation and design issues.  


## Installation

### Swift Package Manager

```
https://github.com/danielsaidi/SwiftKit.git
```

### CocoaPods

```
pod DSSwiftKit
```

Note that you have to import `SwiftKit` with `import DSSwiftKit` if you add it with CocoaPods. The name `SwiftKit` was (not surprising) already taken.


## Contact me

Feel free to reach out if you have questions or if you want to contribute in any way:

* E-mail: [daniel.saidi@gmail.com][Email]
* Twitter: [@danielsaidi][Twitter]
* Web site: [danielsaidi.com][Website]


## License

SwiftKit is available under the MIT license. See [LICENSE][License] file for more info.

[Email]: mailto:daniel.saidi@gmail.com
[Twitter]: http://www.twitter.com/danielsaidi
[Website]: http://www.danielsaidi.com

[GitHub]: https://github.com/danielsaidi/SwiftKit
[License]: https://github.com/danielsaidi/SwiftKit/blob/master/LICENSE

[Authentication]: Readmes/Authentication.md
[Bundle]: Readmes/Bundle.md
[Coding]: Readmes/Coding.md
[Data]: Readmes/Data.md
[Date]: Readmes/Date.md
[Device]: Readmes/Device.md
[Extensions]: Readmes/Extensions.md
[Files]: Readmes/Files.md
[Geo]: Readmes/Geo.md
[IoC]: Readmes/IoC.md
[Keychain]: Readmes/Keychain.md
[Network]: Readmes/Network.md
