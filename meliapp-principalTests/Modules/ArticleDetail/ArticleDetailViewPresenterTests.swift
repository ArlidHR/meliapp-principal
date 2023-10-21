//
//  ArticleDetailViewPresenterTests.swift
//  meliapp-principalTests
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation
import XCTest
@testable import meliapp_principal

class ArticleDetailPresenterTests: XCTestCase {
    
    var presenter = DetailArticlePresenter()
    var mockViewController = MockDetailArticleDisplayLogic()
    
    override func setUp() {
        presenter.viewController = mockViewController
    }
    
    override func tearDown() {
    }
    
    func testpresentServiceError() {
        presenter.presentServiceError()
        XCTAssertTrue(mockViewController.didCallDisplayErrorArticle)
    }
    
    func testpresentListArticle() {
        presenter.presentArticle(items: initDetailArticle())
        XCTAssertTrue(mockViewController.didCallDisplayArticle)
    }
    
    func initDetailArticle() -> DetailArticle {
        return DetailArticle(
            id: "",
            title: "",
            price: 3500000,
            condition: .new,
            pictures: [
                Picture(
                    id: "",
                    url: "",
                    secureURL: "",
                    size: "",
                    maxSize: "",
                    quality: ""
                )
            ]
        )
    }
}
