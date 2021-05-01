# Release notes

Until 1.0, breaking changes can occur in minor versions.


## 0.6.0

### ✨ New features

* `ApiRoute` has more explicit properties for working with post data.
* `iCloudDocumentSync` is a new protocol for syncing iCloud document changes. 
* `String+Slugify` is a new extension that can convert a string to a slugified version.
* `StandardiCloudDocumentSync` is a new class for syncing iCloud document changes.
* `URL+iCloud` contains iCloud-specific URLs and fallback URLs.

### 💡 Behavior changes

* `ApiRoute` now url encodes query and post parameter values.
* `URL+setQueryParameter` no longer url encodes the strings you send in. 

### 💥 Breaking changes

* `ApiRoute` requires new post properties to be defined.



## 0.5.0

This version adjusts code that made the demo not being able to use the SPM package instead of the source files.

### ✨ New features

* `ApiError` is a new enum that replaces the old `ApiServiceError`.
* `FileExporter` is a new protocol for exporting data to the file system.
* `MimeType` is a new enum for simplifying working with mime types.
* `MFMailComposeViewController` has a new `addAttachmentData` that uses the new `MimeType`.
* `StandardFileExporter` is a new `FileExporter` implementation.

### 🗑 Deprecations

* `ApiServiceError` has been deprecated in favor of `ApiError`.

### 💥 Breaking changes

* `ApiError` is a lot easier than before, with many cases gone and more info in the remaining ones.



## 0.4.4

This version adds a new `HttpMethod` enum that can be used with the network components.



## 0.4.3

This version adds new `ApiRoute` request functions and adjusts the url of form data requests.



## 0.4.2

This version adds missing initializers to map services.



## 0.4.1

This version updates dependencies, adjusts project setup, tweak icons and display names etc.



## 0.4.0

This version adds a new `String+Dictation` extension to cleanup dictation objects and spaces from a string.



## 0.3.3

This version adds a new `ExternalMapService` protocol as well as an Apple and a Google implementation.

This version also adds a new `Network` namespace, with api-specific protocols and errors for communicating with external REST apis.



## 0.3.2

This version adds a `UserDefaults+Codable` extension for persisting codable types in `UserDefaults`.



## 0.3.1

This version makes the standard cvs parser use paths instead of urls when parsing files.



## 0.3.0

This version adds improved support for watchOS and tvOS.

The bump version process has been improved to also add linting and a unit test confirmation.



## 0.2.0

This version adds:

* new `Localization` utilities, like `Translator`s and `LocalizationService`s.
* new `FileDirectoryService` utilities.

This version also adds macOS support.



## 0.1.0

This version adds:

* a new `Filter` type that simplifies filtering object collections.
* new `Date` [extensions][Extensions].
* new `Numeric` conversion [extensions][Extensions].



## 0.0.6

This version adds a bunch of [extensions][Extensions] and common utils and updates external test dependencies to the latest versions.



## 0.0.5

This version adds a bunch of [extensions][Extensions] and common types.



## 0.0.4

This version adds [device][Device] and [keychain][Keychain] utils.



## 0.0.3

This version adds a bunch of convenient [extensions][Extensions]. 



## 0.0.2

This version adjusts [authentication][Authentication] service signatures, as well as [coding][Coding] and [IoC][IoC] functionality  



## 0.0.1

This version adds [authentication][Authentication] functionality to `SwiftKit`.


[Authentication]: Readmes/Authentication.md
[Coding]: Readmes/Coding.md 
[Device]: Readmes/Device.md
[Extensions]: Readmes/Extensions.md
[IoC]: Readmes/IoC.md
[Keychain]: Readmes/Keychain.md
