//
//  ArticleDetailMocks.swift
//  meliapp-principalTests
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation
@testable import meliapp_principal

class MockDetailArticleDisplayLogic: DetailArticleDisplayLogic {

    var didCallDisplayArticle: Bool = false
    var didCallDisplayErrorArticle: Bool = false
    
    func displayArticle(viewModel: DetailArticleViewModel) {
        didCallDisplayArticle = true
    }
    
    func displayErrorArticle(text: String) {
        didCallDisplayErrorArticle = true
    }
}

class MockDetailArticlePresentationLogic: ExpectationTest, DetailArticlePresentationLogic {
    
    func presentArticle(items: DetailArticle) {
        checkExpectation("presentArticle")
    }
}

