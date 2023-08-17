# ``SwiftKit``

SwiftKit adds extra functionality to the Swift programming language.



## Overview

![SwiftKit logo](Logo.png)

The online documentation is currently iOS-specific. To generate documentation for other platforms, open the package in Xcode, select a simulator then run `Product/Build Documentation`.

The library is divided into the namespaces found in the Topics section below. For more information, source code, an if you want to report issues, sponsor the project etc., visit the [project repository](https://github.com/danielsaidi/SwiftKit).



## Installation

SwiftKit can be installed with the Swift Package Manager:

```
https://github.com/danielsaidi/SwiftKit.git
```

If you prefer to not have external dependencies, you can also just copy the source code into your app.



## License

SwiftKit is available under the MIT license.



## Topics

### Authentication

- ``Authentication``
- ``AuthenticationService``
- ``AuthenticationServiceError``
- ``BiometricAuthenticationService``
- ``CachedAuthenticationService``
- ``CachedAuthenticationServiceProxy``
- ``LocalAuthenticationService``

### Bundle

- ``BundleInformation``

### Data

- ``Base64StringCoder``
- ``CsvParser``
- ``CsvParserError``
- ``Filter``
- ``FilterOption``
- ``MimeType``
- ``StandardCsvParser``
- ``StringCoder``
- ``StringDecoder``
- ``StringEncoder``

### Date

This namespace contains a lot of date- and calendar-specific extensions.

### Device

- ``DeviceIdentifier``
- ``KeychainBasedDeviceIdentifier``
- ``UserDefaultsBasedDeviceIdentifier``

### Extensions

This namespace contains a lot of extensions and protocols that are applied to native types.

- ``PreferredClosestValue``
- ``NumericStringRepresentable``

### Files

- ``BundleFileFinder``
- ``DirectoryService``
- ``FileExporter``
- ``FileFinder``
- ``StandardDirectoryService``
- ``StandardFileExporter``

### Geo

- ``WorldCoordinate``

### iCloud

- ``iCloudDocumentSync``
- ``StandardiCloudDocumentSync``

### Keychain

- ``KeychainReader``
- ``KeychainService``
- ``KeychainWrapper``
- ``KeychainWriter``
- ``StandardKeychainService``

- ``KeychainAttrRepresentable``
- ``KeychainItemAccessibility``

### Localization

- ``BundleTranslator``
- ``LocalizationNotification``
- ``LocalizationService``
- ``StandardLocalizationService``
- ``StandardTranslator``
- ``Translator``

### Services

- ``Decorator``
- ``MultiProxy``
- ``Proxy``

### Validation

- ``EmailValidator``
- ``Validator``
