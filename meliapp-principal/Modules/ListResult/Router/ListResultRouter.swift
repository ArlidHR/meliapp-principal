//
//  ListResultRouter.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import Foundation
import UIKit

class ListResultRouter: ListResultWireFrame {
    
    weak var viewController: ListResultViewController?
    
    static func assembleModule() -> UIViewController {
        let viewController: ListResultViewController = UIStoryboard(
            name: StringsManager.RouterStrings.listResultViewController,
            bundle: nil
        ).instantiateInitialViewController() as! ListResultViewController
        let presenter = ListResultPresenter()
        let interactor = ListResultInteractor()
        let router = ListResultRouter()
        viewController.interactor = interactor
        viewController.router = router
        interactor.presenter = presenter
        presenter.listResultViewController = viewController
        router.viewController = viewController
        return viewController
    }

    func goToDetailResult(articleId: String) {
        let viewController = DetailArticleRouter.assembleModule(articleId: articleId)
        viewController.modalPresentationStyle = .fullScreen
        self.viewController?.present(
            viewController,
            animated: true,
            completion:  nil
        )
    }
}
