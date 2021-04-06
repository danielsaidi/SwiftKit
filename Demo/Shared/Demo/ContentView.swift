//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI
import SwiftUIKit

struct ContentView: View {
 
    var body: some View {
        NavigationView {
            MenuList("SwiftKit") {
                Section {
                    list1
                    list2
                }
            }.withPlatformSpecificNavigationMode()
        }.withPlatformSpecificNavigationStyle()
    }
}

private extension ContentView {
    
    var list1: some View {
        Group {
            #if os(iOS) || os(macOS)
            MenuListItem(icon: .authentication, title: "Authentication")
                .navigationLink(to: AuthenticationScreen())
            #endif
            MenuListItem(icon: .data, title: "Data")
                .navigationLink(to: DataScreen())
            MenuListItem(icon: .date, title: "Date")
                .navigationLink(to: DateScreen())
            MenuListItem(icon: .device, title: "Device")
                .navigationLink(to: DeviceScreen())
            MenuListItem(icon: .extensions, title: "Extensions")
                .navigationLink(to: ExtensionsScreen())
            MenuListItem(icon: .files, title: "Files")
                .navigationLink(to: FilesScreen())
            MenuListItem(icon: .globe, title: "Geo")
                .navigationLink(to: GeoScreen())
            MenuListItem(icon: .ioc, title: "IoC")
                .navigationLink(to: IoCScreen())
            MenuListItem(icon: .key, title: "Keychain")
                .navigationLink(to: KeychainScreen())
            MenuListItem(icon: .flag, title: "Localization")
                .navigationLink(to: LocalizationScreen())
        }
    }
    
    var list2: some View {
        Group {
            MenuListItem(icon: .cloud, title: "Network")
                .navigationLink(to: NetworkScreen())
            MenuListItem(icon: .service, title: "Services")
                .navigationLink(to: ServicesScreen())
        }
    }
}

private extension View {
    
    func withPlatformSpecificNavigationMode() -> some View {
        #if os(iOS)
        return self
            .navigationBarTitleDisplayMode(.inline)
        #else
        return self
        #endif
    }
    
    func withPlatformSpecificNavigationStyle() -> some View {
        #if os(iOS)
        return self.navigationViewStyle(StackNavigationViewStyle())
        #else
        return self
        #endif
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
