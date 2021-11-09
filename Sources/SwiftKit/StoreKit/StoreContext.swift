//
//  StoreContext.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit
import Combine

/**
 This class can be used to manage store information in a way
 that makes it observable.
 
 Since the `Product` type isn't `Codable`, `products` is not
 permanently persisted, which means that this information is
 reset if the app restarts. Due to this, any changes to this
 property will also update `productIds`, which gives you the
 option to map the IDs to a local product representation and
 present previously fetched products.
 
 Note however that a `Product` instance is needed to perform
 a purchase.
 */
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public class StoreContext: ObservableObject {
    
    public init() {
        productIds = persistedProductIds
        purchasedProductIds = persistedPurchasedProductIds
    }
    
    /**
     The available products.
     
     Since `Product` isn't `Codable`, this property can't be
     persisted. It must be re-fetched when the app starts.
     */
    public var products: [Product] = [] {
        didSet { productIds = products.map { $0.id} }
    }
    
    /**
     The available products IDs.
     
     This list is permanently persisted and can be mapped to
     a local product representation to present temp. product
     info before `products` have been re-fetched.
     */
    @Published
    public private(set) var productIds: [String] = [] {
        willSet { persistedProductIds = newValue }
    }
    
    /**
     The purchased products IDs.
     
     This list is permanently persisted and can be mapped to
     a local product representation to present temp. product
     info before `transactions` have been re-fetched.
     */
    @Published
    public private(set) var purchasedProductIds: [String] = [] {
        willSet { persistedPurchasedProductIds = newValue }
    }
    
    /**
     The active transactions.
     
     Since `Transaction` isn't `Codable` this property can't
     be persisted. It must be re-fetched when the app starts.
     */
    public var transactions: [StoreKit.Transaction] = [] {
        didSet { purchasedProductIds = transactions.map { $0.productID } }
    }
    
    
    // MARK: - Persisted Properties
    
    @Persisted(key: key("productIds"), defaultValue: [])
    private var persistedProductIds: [String]
    
    @Persisted(key: key("purchasedProductIds"), defaultValue: [])
    private var persistedPurchasedProductIds: [String]
}

@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
private extension StoreContext {
    
    static func key(_ name: String) -> String { "store.\(name)" }
}
