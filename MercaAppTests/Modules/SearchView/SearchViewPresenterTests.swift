//
//  SearchViewPresenterTests.swift
//  MercaAppTests
//
//  Created by Nicolas Chavez on 16/05/22.
//

import XCTest
@testable import MercaApp

class SearchViewPresenterTests: XCTestCase {
    
    var presenter = SearchViewPresenter()
    var mockViewController = MockSearchViewDisplayLogic()
    
    override func setUp() {
        presenter.viewController = mockViewController
    }
    
    override func tearDown() {
    }
    
    func testpresentServiceError() {
        presenter.presentServiceError()
        XCTAssertTrue(mockViewController.didCallDisplayListEmptyProduct)
    }
    
    func testpresentListProductEmpty() {
        presenter.presentListProduct(items: [], firstSearch: false)
        XCTAssertTrue(mockViewController.didCallDisplayListEmptyProduct)
    }
    
    func testpresentListProduct() {
        presenter.presentListProduct(items: [initResult(),initResult()], firstSearch: false)
        XCTAssertTrue(mockViewController.didCallDisplayListProduct)
    }
    
    func initResult() -> Result {
        return Result(id: "",
                      siteID: "",
                      title: "",
                      price: 20000,
                      currencyID: "",
                      availableQuantity: 0,
                      soldQuantity: 0,
                      buyingMode: "",
                      listingTypeID: "",
                      stopTime: "",
                      condition: .new,
                      permalink: "",
                      thumbnail: "",
                      thumbnailID: "",
                      acceptsMercadopago: false,
                      installments:
                        Installments(quantity: 0,
                                     amount: 20000,
                                     rate: 0,
                                     currencyID: ""),
                      shipping: Shipping(freeShipping: false,
                                         mode: "",
                                         tags: [],
                                         logisticType: "",
                                         storePickUp: false))
    }
}
