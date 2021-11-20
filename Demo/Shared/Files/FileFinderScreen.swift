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
        List {
            Section {
                ListText("SwiftKit has file finders that let you get files in various ways. This demo uses a BundleFileFinder that looks for files in a certain bundle.")
            }
            
            Section(header: Text("Files that start with \"File\"")) {
                if fileFiles.hasContent {
                    ForEach(fileFiles, id: \.self) {
                        ListText("\($0)")
                    }
                } else {
                    ListText("No files")
                }
            }
            
            Section(header: Text("Files that end with \".txt\"")) {
                if textFiles.hasContent {
                    ForEach(textFiles, id: \.self) {
                        ListText("\($0)")
                    }
                } else {
                    ListText("No files")
                }
            }
        }.navigationTitle("File Finder")
    }
}

struct FileFinderScreen_Previews: PreviewProvider {
    static var previews: some View {
        FileFinderScreen()
    }
}
