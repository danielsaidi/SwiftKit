# Coding

`SwiftKit` contains coders that lets you encode and decode data. In most cases, you probably want to use `Codable` but there are other cases where you may want to inject an abstract coder, e.g. when you have larger systems where coupling should be reduced.

* `StringEncoder/StringDecoder` are protocols that have a single coding function each.
* `StringCoder` implements both `StringEncoder` and `StringDecoder`.
* `Base64StringCoder` can encode strings to base64 and deode base4 strings.

You can create your own string coders by impementing the prototocols in this namespace.
