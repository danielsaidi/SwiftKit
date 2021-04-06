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
        MenuList("Files") {
            Section {
                MenuListText("""
SwiftKit contains services that aim at making it easier to work with files.
""")
            }
            
            Section(header: Text("Services")) {
                MenuListItem(icon: .folder, title: "Directory Service")
                    .navigationLink(to: DirectoryServiceScreen())
                MenuListItem(icon: .fileSearch, title: "File Finder")
                    .navigationLink(to: FileFinderScreen())
            }
        }
    }
}

struct FilesScreen_Previews: PreviewProvider {
    static var previews: some View {
        FilesScreen()
    }
}
