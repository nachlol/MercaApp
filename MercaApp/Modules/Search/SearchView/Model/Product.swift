//
//  Product.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 11/05/22.
//

import Foundation

struct ViewModelProduct {
    let title: String
    let price: String
    let quota: String
    let shippping: String
}

// MARK: - ProductData
struct ProductData: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, siteID, title: String
    let price: Int
    let currencyID: String
    let availableQuantity, soldQuantity: Int
    let buyingMode, listingTypeID, stopTime, condition: String
    let permalink: String
    let thumbnail: String
    let thumbnailID: String
    let acceptsMercadopago: Bool
    let installments: Installments

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
