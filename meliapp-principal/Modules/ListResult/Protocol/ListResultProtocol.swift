//
//  ListResultProtocol.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import Foundation
import UIKit

protocol ListResultViewBusinessLogic {
    func fetchResults(searchedText: String, resultListHasItems: Bool)
}

protocol ListResultViewPresentationLogic {
    func presentServiceError()
    func presentListResult(articles: [Result], resultListHasItems: Bool)
}

protocol ListResultViewDisplayLogic {
    func displayListResult(viewModel: [ViewModelData])
    func displayListEmptyResult(text: String, sizeTitle: CGFloat)
}

protocol ListResultWireFrame: AnyObject {
    func goToDetailResult(articleId: String)
}
