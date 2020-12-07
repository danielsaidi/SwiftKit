//
//  FilesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct FilesScreen: View {
 
    var body: some View {
        DemoList("Files") {
            Section(header: Text("About")) {
                DemoListText("""
SwiftKit contains services that aim at making it easier to work with files.
""")
            }
            
            Section(header: Text("Services")) {
                DemoListLink("Directory Service", .folder, DirectoryServiceScreen())
                DemoListLink("File Finder", .fileSearch, FileFinderScreen())
            }
        }
    }
}

struct FilesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilesScreen()
    }
}
