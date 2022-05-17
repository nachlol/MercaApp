//
//  DetailProductPresenterTests.swift
//  MercaAppTests
//
//  Created by Nicolas Chavez on 16/05/22.
//

import Foundation
import XCTest
@testable import MercaApp

class DetailProductPresenterTests: XCTestCase {
    
    var presenter = DetailProductPresenter()
    var mockViewController = MockDetailProductDisplayLogic()
    
    override func setUp() {
        presenter.viewController = mockViewController
    }
    
    override func tearDown() {
    }
    
    func testpresentServiceError() {
        presenter.presentServiceError()
        XCTAssertTrue(mockViewController.didCallDisplayErrorProduct)
    }
    
    func testpresentListProduct() {
        presenter.presentProduct(items: initDetailProduct())
        XCTAssertTrue(mockViewController.didCallDisplayProduct)
    }
    
    func initDetailProduct() -> DetailProduct {
        return DetailProduct(id: "",
                             siteID: "",
                             title: "",
                             sellerID: 2,
                             categoryID: "",
                             price: 200,
                             basePrice: 3,
                             currencyID: "",
                             initialQuantity: 2,
                             availableQuantity: 2,
                             soldQuantity: 2,
                             saleTerms: [SaleTerm(id: "",
                                                  name: "",
                                                  valueID: "",
                                                  valueName: "",
                                                  valueStruct: Struct(number: 0, unit: ""),
                                                  values: [])],
                             buyingMode: "",
                             listingTypeID: "",
                             startTime: "",
                             stopTime: "",
                             condition: .new,
                             permalink: "",
                             thumbnailID: "",
                             thumbnail: "",
                             secureThumbnail: "",
                             pictures: [Picture(id: "",
                                                url: "",
                                                secureURL: "",
                                                size: "",
                                                maxSize: "",
                                                quality: "")])
    }
}
