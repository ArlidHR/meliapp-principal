//
//  ListResultMocks.swift
//  meliapp-principalTests
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation
import UIKit
@testable import meliapp_principal

class MockListResultViewDisplayLogic: ListResultViewDisplayLogic {
    
    var didCallDisplayListArticle: Bool = false
    var didCallDisplayListEmptyArticle: Bool = false
    
    func displayListResult(viewModel: [ViewModelData]) {
        didCallDisplayListArticle = true
    }
    
    func displayListEmptyResult(text: String, sizeTitle: CGFloat) {
        didCallDisplayListEmptyArticle = true
    }
}

class MockListResultPresentationLogic: ExpectationTest, ListResultViewPresentationLogic {

    func presentListResult(articles: [Result], resultListHasItems: Bool) {
        checkExpectation("presentListResult")
    }
}
