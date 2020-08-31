<p align="center">
    <img src ="Resources/Logo.png" width=500 />
</p>

<p align="center">
    <a href="https://github.com/danielsaidi/SwiftKit">
        <img src="https://badge.fury.io/gh/danielsaidi%2FSwiftKit.svg?style=flat" alt="Version" />
    </a>
    <img src="https://img.shields.io/badge/platform-SwiftUI-red.svg" alt="Swift UI" />
    <img src="https://img.shields.io/badge/Swift-5.2-orange.svg" alt="Swift 5.2" />
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

If things that exist in this library are added to `Swift`, the corresponding functionality in this library will be deprecated and refer to those new features.


## Demo App

This project contains a demo app that demonstrates most things from the library. To run the demo app, just open and run the `SwiftKit.xcodeproj` project.


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


## <a name="why"></a>Why a big "Kit"?

Having a big "kit" is a bad idea, since it may become too generic and hard to overview. For instance, if I want to modify dates, I'm probably not going to dig around in SwiftKit looking for extensions, but rather use the best single-purpose date library.

The GitHub stars confirm this as well. Many years ago, I started putting reusable iOS functionality into a library I call [iExtra](https://github.com/danielsaidi/iExtra). I think it's an amazing library and I use it in most of my apps. To this day, it has 12 stars.

However, each project comes with overhead. If I decided to create a new library for each little thing I make, I'd spend a lot of time setting up each new project. There are funny names to come up with, icons and logos to be made, maintenance etc.

SO instead of honoring every little idea with a new library, I'm going to put most here until they are either too large or too good to be a part of this library. When that happens, they'll break out of their little cage and move into a library of their own.


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
