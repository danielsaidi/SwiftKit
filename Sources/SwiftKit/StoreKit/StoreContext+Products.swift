//
//  StoreContext+Products.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-09.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit

@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public extension StoreContext {
    
    /**
     Whether or not a certain product has an active purchase.
     */
    func isProductPurchased(id: String) -> Bool {
        purchasedProductIds.contains(id)
    }
    
    /**
     Whether or not a certain product has an active purchase.
     */
    func isProductPurchased(_ product: Product) -> Bool {
        isProductPurchased(id: product.id)
    }
}
