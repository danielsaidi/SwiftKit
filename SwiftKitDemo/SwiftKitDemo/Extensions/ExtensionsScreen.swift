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
            SwiftKit contains extensions for native Swift types, e.g. Date.

            Since this namespace will grow much, most extensions are not listed or demonstrated here. Instead, have a look at the source code. It should be pretty well documented.
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
