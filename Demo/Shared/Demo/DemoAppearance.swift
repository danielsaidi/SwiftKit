//
//  DemoAppearance.swift
//  Demo
//
//  Created by Daniel Saidi on 2020-12-07.
//  Copyright © 2020 Daniel Saidi. All rights reserved.
//

import Foundation
#if os(iOS)
import UIKit
#endif

final class DemoAppearance {
    
    private init() {}
    
    static func apply() {
        #if os(iOS)
        if #available(iOS 13.0, *) {
            let appearance = UINavigationBarAppearance()
            let navbar = UINavigationBar.appearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = UIColor.orange
            appearance.titleTextAttributes = titleAttributes
            appearance.largeTitleTextAttributes = titleAttributes
            navbar.standardAppearance = appearance
            navbar.scrollEdgeAppearance = appearance
        }
        #endif
    }
}

private extension DemoAppearance {
    
    static var titleAttributes: [NSAttributedString.Key: Any] {
        [.foregroundColor: UIColor.white, .shadow: shadow]
    }
    
    static var shadow: NSShadow {
        let shadow = NSShadow()
        shadow.shadowBlurRadius = 2
        shadow.shadowColor = UIColor.black.withAlphaComponent(0.4)
        shadow.shadowOffset = CGSize(width: 2, height: 2)
        return shadow
    }
}
