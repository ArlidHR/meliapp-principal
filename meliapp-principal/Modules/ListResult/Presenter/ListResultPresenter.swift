//
//  ListResultPresenter.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import Foundation

class ListResultPresenter: ListResultViewPresentationLogic {

    var listResultViewController: ListResultViewDisplayLogic?
    
    func presentListResult(articles: [Result], resultListHasItems: Bool) {
        let viewModel = articles.compactMap{
            ViewModelData.init(
                idArticle: $0.id,
                titleArticle: $0.title,
                originalPriceArticle: $0.originalPrice,
                priceArticle: $0.price,
                installmentPaymentArticle: "en \($0.installments.quantity)x \($0.installments.amount.colCurrency(enableSymbol: true, fractionDigits:0))",
                freShipppingArticle: $0.shipping.freeShipping ? StringsManager.PresenterStrings.freeShipping: StringsManager.GeneralStrings.notSpace,
                imageArticle: $0.thumbnail,
                officialStoreName: ($0.officialStoreName != nil) ? StringsManager.PresenterStrings.officialStoreName: StringsManager.GeneralStrings.notSpace,
                sellerAddress: $0.address.stateName
            )
        }
        if viewModel.count > 0 {
            listResultViewController?.displayListResult(viewModel: viewModel)
        }else if resultListHasItems {
            listResultViewController?.displayListEmptyResult(
                text: StringsManager.PresenterStrings.welcomeText,
                sizeTitle: 34
            )
        }else {
            listResultViewController?.displayListEmptyResult(
                text: StringsManager.PresenterStrings.noResults,
                sizeTitle: 14
            )
        }
    }

    func presentServiceError() {
        listResultViewController?.displayListEmptyResult(
            text: StringsManager.PresenterStrings.errorConection,
            sizeTitle: 16
        )
    }
}
