# IoC

Inversion of Control and Dependency Injection are important tools to help break coupling within your code base.

`SwiftKit` contains a `IoCContainer` protocol that can be implemented by classes that can resolve dependencies dynamically, based on no or several arguments.

`SwiftKit` also contains two commented out `IoCContainer` implementations: one for `Dip` and one for `Swinject`. Simply copy the commented out code to an app that adds either library as an external dependency, then uncomment the code to get a complete IoC container.

You can create your own IoC container by impementing the prototocol in this namespace.
