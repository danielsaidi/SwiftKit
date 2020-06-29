//
//  ResultText.swift
//  SwiftKitDemo
//
//  Created by Daniel Saidi on 2020-06-04.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import SwiftUI

struct ResultText: View {
    
    init(_ text: String) {
        self.text = text
    }
    
    private let text: String
    
    var body: some View {
        Group {
            if text.hasContent {
                Text(text)
                    .font(.headline)
                    .multilineTextAlignment(.center)
            } else {
                EmptyView()
            }
        }
    }
}

struct ResultText_Previews: PreviewProvider {
    static var previews: some View {
        ResultText("foo")
    }
}
