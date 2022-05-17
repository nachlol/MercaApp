//
//  SearchViewInteractorTests.swift
//  MercaAppTests
//
//  Created by Nicolas Chavez on 16/05/22.
//

import XCTest
@testable import MercaApp

class SearchViewInteractorTests: XCTestCase {
    
    var interactor = SearchViewInteractor()
    var mockPresenter = MockSearchViewPresentationLogic()
    
    override func setUp() {
        interactor.presenter = mockPresenter
    }
    
    override func tearDown() {
    }
    
    func testfetchProducts() {
        mockPresenter.checkExpectation("presentListProduct")
        interactor.fetchProducts(text: "Motorola", firstSearch: false)
    }
    
    func testFirstfetchProducts() {
        mockPresenter.checkExpectation("presentListProduct")
        interactor.fetchProducts(text: "Motorola", firstSearch: true)
    }
    
    
}
