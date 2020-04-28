# Authentication

`SwiftKit` contains services that lets you perform user authentication in varios ways.

* `AuthenticationService` is a protocol that can be implemented by services that can authenticate the current user.
* `BiometricAuthenticationService` performs user authentication using either `FaceID` or `TouchID`.
* `CachedAuthenticationService` is a protocol that can be implemented by authentication services that can cache the authentication result.
* `CachedAuthenticationServiceProxy` wraps any other authentication service and caches the latest successful authentication result.
* `...and more` - this namespace contains more authentication tools as well.

You can create your own authentication services by impementing the prototocols in this namespace, and extend your implementations with the existing proxy implementation.
