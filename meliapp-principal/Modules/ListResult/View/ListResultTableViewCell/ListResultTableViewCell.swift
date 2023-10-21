//
//  ListResultTableViewCell.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import UIKit

class ListResultTableViewCell: UITableViewCell {

    // MARK: - IBOutlet -
    @IBOutlet weak var articleImage: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var installmentPaymentLabel: UILabel!
    @IBOutlet weak var freeShippingLabel: UILabel!
    @IBOutlet weak var officialStoreNameLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    // MARK: - Internal Properties -
    static let identifier = StringsManager.TableViewCellStrings.identifier
    
    static func nib() -> UINib {
        return UINib(nibName: StringsManager.TableViewCellStrings.nibName, bundle: nil)
    }
    
    // MARK: - Lyfecycle -
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
    }
    
    // MARK: - Internal Functions -
    func setUpView(viewModelData: ViewModelData){
        titleLabel.text = viewModelData.titleArticle
        originalPriceLabel.text = viewModelData.originalPriceArticle?.colCurrency(
            enableSymbol: true,
            fractionDigits: 0
        )
        priceLabel.text = viewModelData.priceArticle.colCurrency(
            enableSymbol: true,
            fractionDigits: 0
        )
        installmentPaymentLabel.text = viewModelData.installmentPaymentArticle
        freeShippingLabel.text = viewModelData.freShipppingArticle
        articleImage.imageFromServerURL(
            urlString: viewModelData.imageArticle,
            placeHolderImage: UIImage(
                systemName: StringsManager.TableViewCellStrings.systemName
            ) ?? UIImage()
        )
        officialStoreNameLabel.text = viewModelData.officialStoreName
        addressLabel.text = viewModelData.sellerAddress
    }
}
