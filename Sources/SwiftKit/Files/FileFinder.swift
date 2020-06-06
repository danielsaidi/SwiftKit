import Foundation

/**
 This protocol can be implemented by types that can look for
 files in various ways.
 */
public protocol FileFinder {
    
    func findFilesWithFileNamePrefix(_ prefix: String) -> [String]
    func findFilesWithFileNameSuffix(_ suffix: String) -> [String]
}
