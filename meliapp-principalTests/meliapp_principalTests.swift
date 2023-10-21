//
//  meliapp_principalTests.swift
//  meliapp-principalTests
//
//  Created by Arlid Henao Rueda on 10/10/23.
//

import XCTest
@testable import meliapp_principal

final class meliapp_principalTests: XCTestCase {
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
