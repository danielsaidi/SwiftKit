//
//  FileFinderScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftKit
import SwiftUI
import SwiftUIKit

struct FileFinderScreen: View {
    
    init(finder: FileFinder = BundleFileFinder()) {
        self.finder = finder
    }
    
    private let finder: FileFinder
    
    private var fileFiles: [String] { finder.findFilesWithFileNamePrefix("File").sorted() }
    private var textFiles: [String] { finder.findFilesWithFileNameSuffix(".txt").sorted() }
    
    
    var body: some View {
        MenuList("File Finder") {
            Section {
                MenuListText("SwiftKit has file finders that let you get files in various ways. This demo uses a BundleFileFinder that looks for files in a certain bundle.")
            }
            
            Section(header: Text("Files that start with \"File\"")) {
                if fileFiles.hasContent {
                    ForEach(fileFiles, id: \.self) {
                        MenuListText("\($0)")
                    }
                } else {
                    MenuListText("No files")
                }
            }
            
            Section(header: Text("Files that end with \".txt\"")) {
                if textFiles.hasContent {
                    ForEach(textFiles, id: \.self) {
                        MenuListText("\($0)")
                    }
                } else {
                    MenuListText("No files")
                }
            }
        }
    }
}

struct FileFinderScreen_Previews: PreviewProvider {
    static var previews: some View {
        FileFinderScreen()
    }
}
