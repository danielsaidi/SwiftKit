//
//  StoreService.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit

/**
 This protocol can be implemented by any classes that can be
 used to manage store products.
 */
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public protocol StoreService {
    
    /**
     Get all available products.
     */
    func getProducts() async throws -> [Product]
    
    /**
     Purchase a certain product.
     */
    func purchase(_ product: Product) async throws -> Product.PurchaseResult
    
    /**
     Restore purchases that are not on this device.
     */
    func restorePurchases() async throws
    
    /**
     Sync product and purchase information from the store to
     any implementation defined sync destination.
     */
    func syncStoreData() async throws
}
