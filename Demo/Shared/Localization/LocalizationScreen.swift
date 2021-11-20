//
//  LocalizationScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct LocalizationScreen: View {
 
    var body: some View {
        List {
            Section {
                ListText("SwiftKit has utils for working with localized content.")
            }
            
            Section(header: Text("Services")) {
                ListNavigationLink(destination: LocalizationServiceScreen()) {
                    Label("Localization Service", image: .service)
                }
                ListNavigationLink(destination: TranslatorScreen()) {
                    Label("Translator", image: .flag)
                }
            }
        }.navigationTitle("Keychain")
    }
}

struct LocalizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocalizationScreen()
        }
    }
}
