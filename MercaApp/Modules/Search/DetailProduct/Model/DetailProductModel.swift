//
//  DetailProductModel.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 16/05/22.
//

import Foundation

// MARK: - DetailProductViewModel
struct DetailProductViewModel {
    let condition: Condition
    let title: String
    let image: String
    let price: Double
    let quota: String
    let deliveryDate: String
    let quantityProduct: Int
}

enum Condition: String, Codable {
    case new = "new"
    case used = "used"
}

// MARK: - DetailProduct
struct DetailProduct: Codable {
    let id, siteID, title: String
    let sellerID: Int
    let categoryID: String
    let price: Double
    let basePrice: Int
    let currencyID: String
    let initialQuantity, availableQuantity, soldQuantity: Int
    let saleTerms: [SaleTerm]
    let buyingMode, listingTypeID, startTime, stopTime: String
    let condition: Condition
    let permalink: String
    let thumbnailID: String
    let thumbnail: String
    let secureThumbnail: String
    let pictures: [Picture]

    enum CodingKeys: String, CodingKey {
        case id
        case siteID = "site_id"
        case title
        case sellerID = "seller_id"
        case categoryID = "category_id"
        case price
        case basePrice = "base_price"
        case currencyID = "currency_id"
        case initialQuantity = "initial_quantity"
        case availableQuantity = "available_quantity"
        case soldQuantity = "sold_quantity"
        case saleTerms = "sale_terms"
        case buyingMode = "buying_mode"
        case listingTypeID = "listing_type_id"
        case startTime = "start_time"
        case stopTime = "stop_time"
        case condition, permalink
        case thumbnailID = "thumbnail_id"
        case thumbnail
        case secureThumbnail = "secure_thumbnail"
        case pictures
    }
}

// MARK: - Value
struct Value: Codable {
    let id: String?
    let name: String
    let valueStruct: Struct?

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueStruct = "struct"
    }
}

// MARK: - Struct
struct Struct: Codable {
    let number: Int
    let unit: String
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
    let secureURL: String
    let size, maxSize, quality: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}

// MARK: - SaleTerm
struct SaleTerm: Codable {
    let id, name: String
    let valueID: String?
    let valueName: String
    let valueStruct: Struct?
    let values: [Value]

    enum CodingKeys: String, CodingKey {
        case id, name
        case valueID = "value_id"
        case valueName = "value_name"
        case valueStruct = "value_struct"
        case values
    }
}

