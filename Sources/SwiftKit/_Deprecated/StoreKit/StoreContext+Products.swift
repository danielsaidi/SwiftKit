//
//  StoreContext+Products.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-09.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit

@available(*, deprecated, message: "StoreContext has been moved to StoreKitPlus - https://github.com/danielsaidi/StoreKitPlus")
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public extension StoreContext {
    
    func isProductPurchased(id: String) -> Bool {
        purchasedProductIds.contains(id)
    }
    
    func isProductPurchased(_ product: Product) -> Bool {
        isProductPurchased(id: product.id)
    }
}
