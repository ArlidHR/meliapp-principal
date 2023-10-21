//
//  ListResultViewController.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import UIKit

class ListResultViewController: UIViewController {

    // MARK: - IBOutlet -
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet weak var listResultTableView: UITableView!

    // MARK: - Internal Properties -
    var interactor: ListResultViewBusinessLogic?
    var router: ListResultWireFrame?
    var listResult: [ViewModelData] = []
    
    // MARK: - LyfeCycle -
    override func viewDidLoad() {
        super.viewDidLoad()
        interactor?.fetchResults(
            searchedText: searchTextField.text ?? "",
            resultListHasItems: true
        )
        registerTableView()
        setUpTextfield()
    }

    // MARK: - Private Functions -
    private func setUpTextfield() {
        searchTextField.delegate = self
        searchTextField.setLeftPaddingPoints(35)
        searchTextField.layer.borderColor = UIColor.red.cgColor
        searchTextField.placeholder = StringsManager.ViewControllerString.searchTextField
    }

    private func registerTableView() {
        listResultTableView.delegate = self
        listResultTableView.dataSource = self
        listResultTableView.register(
            ListResultTableViewCell.nib(),
            forCellReuseIdentifier: ListResultTableViewCell.identifier
        )
    }
}

//  MARK: - SearchViewDisplayLogic -
extension ListResultViewController: ListResultViewDisplayLogic {
    func displayListResult(viewModel: [ViewModelData]) {
        listResult.removeAll()
        listResult = viewModel
        DispatchQueue.main.async {
            self.listResultTableView.reloadData()
            self.listResultTableView.restore()
        }
    }

    func displayListEmptyResult(text: String, sizeTitle: CGFloat) {
        listResult.removeAll()
        DispatchQueue.main.async {
            self.listResultTableView.setEmptyMessage(text, size: sizeTitle)
            self.listResultTableView.reloadData()
        }
    }
}

//  MARK: - UITextFieldDelegate -
extension ListResultViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        if textField.text != "" {
            if let textSearch = textField.text {
                interactor?.fetchResults(
                    searchedText: textSearch,
                    resultListHasItems: false
                )
            }
        }
        return true
    }
}

extension ListResultViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        router?.goToDetailResult(
            articleId: listResult[indexPath.row].idArticle
        )
    }
}

extension ListResultViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        listResult.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: ListResultTableViewCell.identifier,
            for: indexPath
        ) as! ListResultTableViewCell
        cell.setUpView(
            viewModelData: listResult[
                indexPath.row
            ]
        )
        return cell
    }
}
