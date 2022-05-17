//
//  Product.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 11/05/22.
//

import Foundation

// MARK: - ViewModelProduct
struct ViewModelProduct {
    let id: String  
    let title: String
    let price: Double
    let quota: String
    let shippping: String
    let image: String
}

// MARK: - ProductData
struct ProductData: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, siteID, title: String
    let price: Double
    let currencyID: String
    let availableQuantity, soldQuantity: Int
    let buyingMode, listingTypeID, stopTime: String
    let condition: Condition
    let permalink: String
    let thumbnail: String
    let thumbnailID: String
    let acceptsMercadopago: Bool
    let installments: Installments
    let shipping: Shipping

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title, price
        case currencyID = "currency_id"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case stopTime = "stop_time"
        case condition, permalink, thumbnail
        case thumbnailID = "thumbnail_id"
        case acceptsMercadopago = "accepts_mercadopago"
        case installments
        case shipping
    }
}

// MARK: - Installments
struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let rate: Int
    let currencyID: String

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool
    let mode: String
    let tags: [String]
    let logisticType: String
    let storePickUp: Bool

    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
        case mode, tags
        case logisticType = "logistic_type"
        case storePickUp = "store_pick_up"
    }
}
