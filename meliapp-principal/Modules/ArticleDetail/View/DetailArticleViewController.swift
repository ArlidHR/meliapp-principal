//
//  DetailArticleViewController.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import UIKit

class DetailArticleViewController: UIViewController {

    // MARK: - IBOutlet -
    @IBOutlet weak var condittionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var quotaLabel: UILabel!

    // MARK: - Internal Properties -
    var interactor: DetailArticleBusinessLogic?
    var router: DetailArticleWireFrame?
    var articleId: String?

    // MARK: - LyfeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        loadInfo()
    }

    // MARK: - Private Functions -
    private func loadInfo() {
        guard let articleId = articleId else {
            return
        }
        interactor?.fetchInfoArticle(id: articleId)
    }

    private func textCondition(condition: Condition) -> String {
        switch condition {
        case .new:
            return StringsManager.ViewControllerString.conditionNew
        case .used:
            return StringsManager.ViewControllerString.conditionNew
        }
    }

    private func showAlert(title: String,message: String) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        alert.addAction(
            UIAlertAction(
                title: StringsManager.ViewControllerString.accept,
                style: .default,
                handler: nil
            )
        )
        alert.addAction(
            UIAlertAction(
                title: StringsManager.ViewControllerString.cancel,
                style: .destructive,
                handler: nil
            )
        )
        self.present(
            alert,
            animated: true,
            completion: nil
        )
    }

    // MARK: - @IBAction -
    @IBAction func backButton(_ sender: UIButton){
        router?.gotoBackHome()
    }
    
}

// MARK: - DetailArticleDisplayLogic -
extension DetailArticleViewController: DetailArticleDisplayLogic {
    func displayArticle(viewModel: DetailArticleViewModel) {
        DispatchQueue.main.async {
            self.condittionLabel.text = self.textCondition(
                condition: viewModel.conditionArticle
            )
            self.titleLabel.text = viewModel.titleArticle
            self.priceLabel.text = viewModel.priceArticle.colCurrency(
                enableSymbol: true,
                fractionDigits: 0
            )
            self.quotaLabel.text = viewModel.quotaArticle
            self.articleImage.imageFromServerURL(
                urlString: viewModel.imageArticle,
                placeHolderImage: UIImage(
                    systemName: StringsManager.ViewControllerString.systemNameDetail
                ) ?? UIImage()
            )
        }
    }
    
    func displayErrorArticle(text: String) {
        showAlert(
            title: StringsManager.GeneralStrings.error,
            message: text
        )
    }
}
