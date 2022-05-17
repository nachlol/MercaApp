//
//  SearchViewMocks.swift
//  MercaAppTests
//
//  Created by Nicolas Chavez on 16/05/22.
//

import Foundation
import UIKit
@testable import MercaApp

class MockSearchViewDisplayLogic: SearchViewDisplayLogic {
    
    var didCallDisplayListProduct: Bool = false
    var didCallDisplayListEmptyProduct: Bool = false
    
    func displayListProduct(viewModel: [ViewModelProduct]) {
        didCallDisplayListProduct = true
    }
    
    func displayListEmptyProduct(text: String, sizeTitle: CGFloat) {
        didCallDisplayListEmptyProduct = true
    }
}

class MockSearchViewPresentationLogic: ExpectationTest, SearchViewPresentationLogic {

    func presentListProduct(items: [Result], firstSearch: Bool) {
        checkExpectation("presentListProduct")
    }
}
