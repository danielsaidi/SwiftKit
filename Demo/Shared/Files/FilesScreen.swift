//
//  FilesScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct FilesScreen: View {
    
    var body: some View {
        List {
            Section {
                ListText("""
SwiftKit contains services that aim at making it easier to work with files.
""")
            }
            
            Section(header: Text("Services")) {
                ListNavigationLink(destination: DirectoryServiceScreen()) {
                    Label("Directory Service", image: .folder)
                }
                ListNavigationLink(destination: FileFinderScreen()) {
                    Label("File Finder", image: .fileSearch)
                }
            }
        }.navigationTitle("Files")
    }
}

struct FilesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilesScreen()
    }
}
