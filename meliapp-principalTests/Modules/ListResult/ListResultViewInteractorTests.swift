//
//  ListResultViewInteractorTests.swift
//  meliapp-principalTests
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import XCTest
@testable import meliapp_principal

class ListResultViewInteractorTests: XCTestCase {
    
    var interactor = ListResultInteractor()
    var mockPresenter = MockListResultPresentationLogic()
    
    override func setUp() {
        interactor.presenter = mockPresenter
    }
    
    override func tearDown() {
    }
    
    func testfetchArticles() {
        mockPresenter.checkExpectation("presentListResult")
        interactor.fetchResults(searchedText: "Iphone", resultListHasItems: false)
    }
    
    func testFirstfetchArticles() {
        mockPresenter.checkExpectation("presentListResult")
        interactor.fetchResults(searchedText: "Iphone", resultListHasItems: true)
    }
}

