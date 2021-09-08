import Foundation

/**
 This protocol can be implemented by types that can look for
 files in various ways.
 */
public protocol FileFinder {
    
    /**
     Find files with names that start with a certain prefix.
     */
    func findFilesWithFileNamePrefix(_ prefix: String) -> [String]
    
    /**
     Find files with names that end with a certain suffix.
     */
    func findFilesWithFileNameSuffix(_ suffix: String) -> [String]
}
