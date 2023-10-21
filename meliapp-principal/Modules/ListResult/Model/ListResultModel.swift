//
//  ListResultModel.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 12/10/23.
//

import Foundation

// MARK: - ListResultViewModel
struct ListResultViewModel: Codable {
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {
    let id, title: String
    let thumbnail: String
    let price: Double
    let originalPrice: Double?
    let officialStoreID: Int?
    let officialStoreName: String?
    let shipping: Shipping
    let installments: Installments
    let address: Address

    enum CodingKeys: String, CodingKey {
        case id, title
        case thumbnail
        case price
        case originalPrice = "original_price"
        case officialStoreID = "official_store_id"
        case officialStoreName = "official_store_name"
        case shipping
        case installments
        case address
    }
}

// MARK: - Shipping
struct Shipping: Codable {
    let freeShipping: Bool
    
    enum CodingKeys: String, CodingKey {
        case freeShipping = "free_shipping"
    }
}

// MARK: - Installments
struct Installments: Codable {
    let quantity: Int
    let amount: Double
    let rate: Int
    let currencyID: String

    enum CodingKeys: String, CodingKey {
        case quantity, amount, rate
        case currencyID = "currency_id"
    }
}

// MARK: - Address
struct Address: Codable {
    let stateID: String
    let stateName: String
    let cityID, cityName: String

    enum CodingKeys: String, CodingKey {
        case stateID = "state_id"
        case stateName = "state_name"
        case cityID = "city_id"
        case cityName = "city_name"
    }
}

// MARK: - ViewModelData
struct ViewModelData {
    let idArticle: String
    let titleArticle: String
    let originalPriceArticle: Double?
    let priceArticle: Double
    let installmentPaymentArticle: String
    let freShipppingArticle: String
    let imageArticle: String
    let officialStoreName: String?
    let sellerAddress: String?
}
