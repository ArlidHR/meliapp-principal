//
//  DetailArticleProtocol.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation

protocol DetailArticleBusinessLogic {
    func fetchInfoArticle(id: String)
}

protocol DetailArticlePresentationLogic {
    func presentServiceError()
    func presentArticle(items: DetailArticle)
}

protocol DetailArticleDisplayLogic {
    func displayArticle(viewModel: DetailArticleViewModel)
    func displayErrorArticle(text: String)
}

protocol DetailArticleWireFrame: AnyObject {
    func gotoBackHome()
}
