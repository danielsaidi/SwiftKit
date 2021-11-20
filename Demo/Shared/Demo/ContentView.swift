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
            List {
                Section {
                    list1
                    list2
                }
            }
            .navigationTitle("SwiftKit")
            .withPlatformSpecificNavigationMode()
        }.withPlatformSpecificNavigationStyle()
    }
}

private extension ContentView {
    
    var list1: some View {
        Group {
            #if os(iOS) || os(macOS)
            ListNavigationLink(destination: AuthenticationScreen()) {
                Label("Authentication", image: .authentication)
            }
            #endif
            ListNavigationLink(destination: DataScreen()) {
                Label("Data", image: .data)
            }
            ListNavigationLink(destination: DateScreen()) {
                Label("Date", image: .date)
            }
            ListNavigationLink(destination: DeviceScreen()) {
                Label("Device", image: .device)
            }
            ListNavigationLink(destination: ExtensionsScreen()) {
                Label("Extensions", image: .extensions)
            }
            ListNavigationLink(destination: FilesScreen()) {
                Label("Files", image: .files)
            }
            ListNavigationLink(destination: GeoScreen()) {
                Label("Geo", image: .globe)
            }
            ListNavigationLink(destination: IoCScreen()) {
                Label("IoC", image: .ioc)
            }
            ListNavigationLink(destination: KeychainScreen()) {
                Label("Keychain", image: .key)
            }
            ListNavigationLink(destination: LocalizationScreen()) {
                Label("Localization", image: .flag)
            }
        }
    }
    
    var list2: some View {
        Group {
            ListNavigationLink(destination: NetworkScreen()) {
                Label("Network", image: .cloud)
            }
            ListNavigationLink(destination: ServicesScreen()) {
                Label("Services", image: .service)
            }
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
