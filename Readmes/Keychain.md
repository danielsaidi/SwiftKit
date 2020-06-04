# Keychain

`SwiftKit` contains tools for working with the device keychain.

* `KeychainReader` is a protocol that can be implemented by services that can read from the keychain.
* `KeychainWriter` is a protocol that can be implemented by services that can write to the keychain.
* `KeychainService` is a protocol that implements both `KeychainReader` and `KeychainWriter`.
* `KeychainWrapper` is a util class that can read from and write to the keychain.
* `StandardKeychainService` implements `KeychainService` and uses a wrapper to read from and write to the keychain.

These tools are used in other parts of the library, e.g. to persist unique device identifiers.
