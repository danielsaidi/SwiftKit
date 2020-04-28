//
//  ExtensionsScreen.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ExtensionsScreen: View {
    var body: some View {
        ScrollView(.vertical) {
            Text("""
            SwiftKit contains extensions to native Swift types, e.g. Date.

            Since this namespace will probably grow much, individual extensions are not listed or demonstrated here. Instead, have a look at the source code to see what kind of extensions this library contains. They should all be pretty well documented.
            """).lineLimit(1000)
                .padding()
        }.navigationBarTitle("Extensions")
    }
}

struct ExtensionsScreen_Previews: PreviewProvider {
    static var previews: some View {
        ExtensionsScreen()
    }
}
