//
//  DetailArticlePresenter.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation

class DetailArticlePresenter: DetailArticlePresentationLogic {

    var viewController: DetailArticleDisplayLogic?

    func presentServiceError() {
        viewController?.displayErrorArticle(
            text: StringsManager.PresenterStrings.errorMessage
        )
    }

    func presentArticle(items: DetailArticle) {
        let viewModel = DetailArticleViewModel(
            conditionArticle: items.condition,
            titleArticle: items.title,
            imageArticle: items.pictures[0].url,
            priceArticle: items.price,
            quotaArticle: StringsManager.PresenterStrings.maximumInstallments
        )
        viewController?.displayArticle(viewModel: viewModel)
    }
}
