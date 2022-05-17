//
//  DetailProductInteractorTests.swift
//  MercaAppTests
//
//  Created by Nicolas Chavez on 16/05/22.
//

import Foundation
import XCTest
@testable import MercaApp

class DetailProductInteractorTests: XCTestCase {
    
    var interactor = DetailProductInteractor()
    var mockPresenter = MockDetailProductPresentationLogic()
    
    override func setUp() {
        interactor.presenter = mockPresenter
    }
    
    override func tearDown() {
    }
    
    func testfetchInfoProduct() {
        mockPresenter.checkExpectation("presentProduct")
        interactor.fetchInfoProduct(id: "MCO593276244")
    }
}
