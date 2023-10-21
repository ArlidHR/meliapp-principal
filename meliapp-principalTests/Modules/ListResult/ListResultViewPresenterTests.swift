//
//  ListResultViewPresenterTests.swift
//  meliapp-principalTests
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

@testable import meliapp_principal
import XCTest

class ListResultViewPresenterTests: XCTestCase {
    var presenter = ListResultPresenter()
    var mockViewController = MockListResultViewDisplayLogic()
    
    override func setUp() {
        presenter.listResultViewController = mockViewController
    }
    
    override func tearDown() {
    }
    
    func testpresentServiceError() {
        presenter.presentServiceError()
        XCTAssertTrue(mockViewController.didCallDisplayListEmptyArticle)
    }
    
    func testpresentListArticleEmpty() {
        presenter.presentListResult(articles: [], resultListHasItems: false)
        XCTAssertTrue(mockViewController.didCallDisplayListEmptyArticle)
    }
    
    func testpresentListArticle() {
        presenter.presentListResult(articles: [initResult(),initResult()], resultListHasItems: false)
        XCTAssertTrue(mockViewController.didCallDisplayListArticle)
    }
    
    func initResult() -> Result {
        return Result(
            id: "",
            title: "",
            thumbnail: "",
            price: 3500000,
            originalPrice: 4900000,
            officialStoreID: 0,
            officialStoreName: "",
            shipping: Shipping(
                freeShipping: true
            ),
            installments: Installments(
                quantity: 45,
                amount: 34.7,
                rate: 23,
                currencyID: ""
            ),
            address: Address(
                stateID: "",
                stateName: "",
                cityID: "",
                cityName: ""
            )
        )
    }
}
