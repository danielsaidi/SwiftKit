# Geo

`SwiftKit` contains a set of `Geo`-specific extensions and utilities that simplifies working with geo-based data.

* `ExternalMapService` is a protocol that can be implemented by external apps that can be used for looking up coordinates and perform navigations. There are two implementations: `AppleMapsService` and `GoogleMapsService`. 
* `WorldCoordinate` is a struct with global, well-known coordinates, like `.tokyo`.
