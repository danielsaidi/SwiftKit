//
//  StoreContext.swift
//  SwiftKit
//
//  Created by Daniel Saidi on 2021-11-08.
//  Copyright © 2021 Daniel Saidi. All rights reserved.
//

import StoreKit
import Combine

@available(*, deprecated, message: "StoreContext has been moved to StoreKitPlus - https://github.com/danielsaidi/StoreKitPlus")
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
public class StoreContext: ObservableObject {
    
    public init() {
        productIds = persistedProductIds
        purchasedProductIds = persistedPurchasedProductIds
    }
    
    public var products: [Product] = [] {
        didSet { productIds = products.map { $0.id} }
    }
    
    @Published
    public private(set) var productIds: [String] = [] {
        willSet { persistedProductIds = newValue }
    }
    
    @Published
    public private(set) var purchasedProductIds: [String] = [] {
        willSet { persistedPurchasedProductIds = newValue }
    }
    
    public var transactions: [StoreKit.Transaction] = [] {
        didSet { purchasedProductIds = transactions.map { $0.productID } }
    }
    
    
    @Persisted(key: key("productIds"), defaultValue: [])
    private var persistedProductIds: [String]
    
    @Persisted(key: key("purchasedProductIds"), defaultValue: [])
    private var persistedPurchasedProductIds: [String]
}

@available(*, deprecated, message: "StoreContext has been moved to StoreKitPlus - https://github.com/danielsaidi/StoreKitPlus")
@available(iOS 15.0, macOS 12.0, watchOS 8.0, tvOS 15.0, *)
private extension StoreContext {
    
    static func key(_ name: String) -> String { "store.\(name)" }
}
