//
//  ListProductTableViewCell.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import UIKit

class ListProductTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var qualificationLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var installmentPaymentLabel: UILabel!
    @IBOutlet weak var freeShippingLabel: UILabel!
    @IBOutlet weak var officialStoreNameLabel: UILabel!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
