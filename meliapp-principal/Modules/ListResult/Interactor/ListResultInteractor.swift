//
//  ListResultInteractor.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import Foundation

class ListResultInteractor: ListResultViewBusinessLogic {
    
    var presenter: ListResultViewPresentationLogic?
    
    func fetchResults(searchedText: String, resultListHasItems: Bool) {
        var _: String = searchedText.replacingOccurrences(
            of: StringsManager.GeneralStrings.emptySpace,
            with: StringsManager.GeneralStrings.notSpace
        )
        let request = HttpRequests()
        guard let setUrl = URL(
            string: StringsManager.GeneralStrings.urlMain+StringsManager.Endpoints.searchArticles+searchedText
        ) else {
            return
        }
        request.getHttpRequestCodable(
            relPath: setUrl,
            httpMethod: StringsManager.InteractorStrings.httpMethod,
            param:[:],
            type: ListResultViewModel.self,
            errorBlock: { 
                (data,error) in
            guard let presenter = self.presenter else { return }
            presenter.presentServiceError()
        }) { (response, code, data, headers) in
            guard let data = response as? ListResultViewModel else{ return }
            guard let presenter = self.presenter else { return }
            switch code {
            case 200:
                presenter.presentListResult(
                    articles: data.results,
                    resultListHasItems: resultListHasItems
                )
            default:
                presenter.presentServiceError()
            }
        }
    }
}
