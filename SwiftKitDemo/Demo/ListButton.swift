//
//  ListButton.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-04-28.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ListButton: View {
    
    init(text: String, description: String, action: @escaping () -> Void) {
        self.text = text
        self.description = description
        self.action = action
    }
    
    private let text: String
    private let description: String
    private let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            HStack {
                VStack(alignment: .leading, spacing: 10) {
                    Text(text).font(.headline)
                    Text(description)
                }
            }
        }
    }
}

struct ListButton_Previews: PreviewProvider {
    
    static var previews: some View {
        ListButton(
            text: "Do something",
            description: "This button will do something remarkable, something almost magic. Tap it and see for yourself.",
            action: { fatalError() })
    }
}
