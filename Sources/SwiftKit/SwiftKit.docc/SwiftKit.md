# ``SwiftKit``

SwiftKit adds extra functionality to the Swift framework, like extensions to native types, utilites, services etc.


## Overview

![SwiftKit logo](Logo.png)

SwiftKit is divided into the sections found in the Topics section below.

You can explore the sections in the documentation or in the demo app.


## Topics

### Authentication

- ``Authentication``
- ``AuthenticationService``
- ``AuthenticationServiceError``
- ``BiometricAuthenticationService``
- ``CachedAuthenticationService``
- ``CachedAuthenticationServiceProxy``

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

This namespace contains geo-specific extensions as well as utils:

- ``AppleMapsService``
- ``ExternalMapService``
- ``GoogleMapsService``
- ``WorldCoordinate``

### iCloud

This namespace contains iCloud-specific extensions as well as utils:

- ``iCloudDocumentSync``
- ``StandardiCloudDocumentSync``

### IoC

This namespace contains disabled `Dip` and `Swinject` containers.

- ``IoC``
- ``IoCContainer``

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

### Messaging

This namespace contains composer extensions.

### Network

- ``ApiCompletion``
- ``ApiEnvironment``
- ``ApiError``
- ``ApiModel``
- ``ApiResult``
- ``ApiRoute``
- ``ApiService``
- ``HttpMethod``

### Services

- ``Decorator``
- ``MultiProxy``
- ``Proxy``

### Validation

- ``EmailValidator``
- ``Validator``
