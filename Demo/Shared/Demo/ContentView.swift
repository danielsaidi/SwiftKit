//
//  ContentView.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-11-27.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ContentView: View {
 
    var body: some View {
        NavigationView {
            DemoList("SwiftKit") {
                Section(header: Text("Sections")) {
                    list1
                    list2
                }
            }
        }.withPlatformSpecificNavigationStyle()
    }
}

private extension ContentView {
    
    var list1: some View {
        Group {
            #if os(iOS) || os(macOS)
            DemoListLink("Authentication", .authentication, AuthenticationScreen())
            #endif
            DemoListLink("Data", .data, DataScreen())
            DemoListLink("Date", .date, DateScreen())
            DemoListLink("Device", .device, DeviceScreen())
            DemoListLink("Extensions", .extensions, ExtensionsScreen())
            DemoListLink("Files", .files, FilesScreen())
            DemoListLink("Geo", .globe, GeoScreen())
            DemoListLink("IoC", .ioc, IoCScreen())
            DemoListLink("Keychain", .key, KeychainScreen())
            DemoListLink("Localization", .flag, LocalizationScreen())
        }
    }
    
    var list2: some View {
        Group {
            DemoListLink("Network", .cloud, NetworkScreen())
            DemoListLink("Services", .service, ServicesScreen())
        }
    }
}

private extension View {
    
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
