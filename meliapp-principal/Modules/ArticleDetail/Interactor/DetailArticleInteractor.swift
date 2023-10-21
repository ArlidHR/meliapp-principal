//
//  DetailArticleInteractor.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation

class DetailArticleInteractor: DetailArticleBusinessLogic {

    var presenter: DetailArticlePresentationLogic?

    func fetchInfoArticle(id: String) {
        let peticion = HttpRequests()
        guard let url = URL(
            string: StringsManager.GeneralStrings.urlMain+StringsManager.Endpoints.detailArticles+id
        ) else {  return }
        peticion.getHttpRequestCodable(
            relPath: url,
            httpMethod: StringsManager.InteractorStrings.httpMethod,
            param:[:],
            type: DetailArticle.self,
            errorBlock: { (data,error) in
            guard let presenter = self.presenter else { return }
            presenter.presentServiceError()
        }) { (response, code, data, headers) in
            guard let data = response as? DetailArticle else{ return }
            guard let presenter = self.presenter else { return }
            switch code {
            case 200:
                presenter.presentArticle(items: data)
            default:
                presenter.presentServiceError()
            }
        }
    }
}
