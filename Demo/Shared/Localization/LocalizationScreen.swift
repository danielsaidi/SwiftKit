//
//  LocalizationScreen.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct LocalizationScreen: View {
 
    var body: some View {
        DemoList("Keychain") {
            Section(header: Text("About")) {
                DemoListText("SwiftKit has utils for working with localized content.")
            }
            
            Section(header: Text("Services")) {
                DemoListLink("Localization Service", .settings, LocalizationServiceScreen())
                DemoListLink("Translator", .flag, TranslatorScreen())
            }
        }
    }
}

struct LocalizationScreen_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            LocalizationScreen()
        }
    }
}
