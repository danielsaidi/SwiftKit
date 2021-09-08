import Foundation

/**
 This class can be used to find files witin a certain bundle.
 */
public class BundleFileFinder: FileFinder {
    
    public init(bundle: Bundle = .main) {
        self.bundle = bundle
    }
    
    private let bundle: Bundle
    
    /**
     Find files with names that start with a certain prefix.
     */
    public func findFilesWithFileNamePrefix(_ prefix: String) -> [String] {
        let format = "self BEGINSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [prefix])
        return findFilesWithPredicate(predicate)
    }
    
    /**
     Find files with names that end with a certain suffix.
     */
    public func findFilesWithFileNameSuffix(_ suffix: String) -> [String] {
        let format = "self ENDSWITH %@"
        let predicate = NSPredicate(format: format, argumentArray: [suffix])
        return findFilesWithPredicate(predicate)
    }
}

private extension BundleFileFinder {
    
    func findFilesWithPredicate(_ predicate: NSPredicate) -> [String] {
        do {
            let path = bundle.bundlePath
            let fileManager = FileManager.default
            let files = try fileManager.contentsOfDirectory(atPath: path)
            let array = files as NSArray
            let filteredFiles = array.filtered(using: predicate)
            return filteredFiles as? [String] ?? []
        } catch {
            return [String]()
        }
    }
}
