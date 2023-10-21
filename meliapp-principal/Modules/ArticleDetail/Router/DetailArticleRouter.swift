//
//  DetailArticleRouter.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation
import UIKit

class DetailArticleRouter: DetailArticleWireFrame {

    weak var viewController: DetailArticleViewController?

    static func assembleModule(articleId: String) -> UIViewController {
        let viewController: DetailArticleViewController = UIStoryboard(
            name: StringsManager.RouterStrings.listResultViewControllerDetail,
            bundle: nil
        ).instantiateInitialViewController() as! DetailArticleViewController
        let presenter = DetailArticlePresenter()
        let interactor = DetailArticleInteractor()
        let router = DetailArticleRouter()
        viewController.interactor = interactor
        viewController.router = router
        viewController.articleId = articleId
        interactor.presenter = presenter
        presenter.viewController = viewController
        router.viewController = viewController
        return viewController
    }

    func gotoBackHome() {
        self.viewController?.dismiss(
            animated: true,
            completion: nil
        )
    }
}

