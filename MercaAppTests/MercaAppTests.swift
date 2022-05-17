//
//  MercaAppTests.swift
//  MercaAppTests
//
//  Created by Nicolas Chavez on 11/05/22.
//

import XCTest
@testable import MercaApp

class MercaAppTests: XCTestCase {

}

class ExpectationTest {
    var expectation: XCTestExpectation?
    var code: Int?
    var presentServiceErrorCalled = false

    convenience init(expectation: XCTestExpectation) {
        self.init()
        self.expectation = expectation
    }

    init() {
    }

    func presentServiceError() {
        presentServiceErrorCalled = true
        checkExpectation("presentServiceError")
    }

    func checkExpectation(_ description: String) {
        if expectation?.description == description {
            expectation?.fulfill()
        }
    }
}
