//
//  ArticleDetailViewInteractorTests.swift
//  meliapp-principalTests
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation
import XCTest
@testable import meliapp_principal

class ArticleDetailInteractorTests: XCTestCase {
    
    var interactor = DetailArticleInteractor()
    var mockPresenter = MockDetailArticlePresentationLogic()
    
    override func setUp() {
        interactor.presenter = mockPresenter
    }
    
    override func tearDown() {
    }
    
    func testfetchInfoArticle() {
        mockPresenter.checkExpectation("presentArticle")
        interactor.fetchInfoArticle(id: "MCO1349815979")
    }
}

