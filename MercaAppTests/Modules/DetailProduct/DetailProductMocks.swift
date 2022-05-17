//
//  DetailProductMocks.swift
//  MercaAppTests
//
//  Created by Nicolas Chavez on 16/05/22.
//

import Foundation
@testable import MercaApp

class MockDetailProductDisplayLogic: DetailProductDisplayLogic {

    var didCallDisplayProduct: Bool = false
    var didCallDisplayErrorProduct: Bool = false
    
    func displayProduct(viewModel: DetailProductViewModel) {
        didCallDisplayProduct = true
    }
    
    func displayErrorProduct(text: String) {
        didCallDisplayErrorProduct = true
    }
}

class MockDetailProductPresentationLogic: ExpectationTest, DetailProductPresentationLogic {
    
    func presentProduct(items: DetailProduct) {
        checkExpectation("presentProduct")
    }
}
