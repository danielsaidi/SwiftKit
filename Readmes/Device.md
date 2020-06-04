# Device

`SwiftKit` contains device-specific tools.

* `DeviceIdentifier` is a protocol that can be implemented by classes that can uniquely identify the current device.
* `KeychainBasedDeviceIdentifier` persists device identifiation information in the keychain.
* `UserDefaultsBasedDeviceIdentifier` persists device identifiation information in user defaults.

Note that this namespace doesn't know anything about `UIDevice`, since it is `UIKit` agnostic.
