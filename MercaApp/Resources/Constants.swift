//
//  Constants.swift
//  MercaApp
//
//  Created by Nicolas Chavez on 11/05/22.

import Foundation

struct Constants {
    struct URL {
       static let main = "https://api.mercadolibre.com"
    }
    
    struct Endpoints {
        static let searchItems = "/sites/MCO/search?q="
        static let detailItem = "/items/"
    }
}
