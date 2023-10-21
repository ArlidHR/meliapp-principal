//
//  DetailArticleModel.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 20/10/23.
//

import Foundation

enum Condition: String, Codable {
    case new = "new"
    case used = "used"
}

// MARK: - DetailArticle
struct DetailArticle: Codable {
    let id, title: String
    let price: Double
    let condition: Condition
    let pictures: [Picture]

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case price
        case condition
        case pictures
    }
}

// MARK: - Picture
struct Picture: Codable {
    let id: String
    let url: String
    let secureURL: String
    let size, maxSize, quality: String

    enum CodingKeys: String, CodingKey {
        case id, url
        case secureURL = "secure_url"
        case size
        case maxSize = "max_size"
        case quality
    }
}

// MARK: - DetailArticleViewModel
struct DetailArticleViewModel {
    let conditionArticle: Condition
    let titleArticle: String
    let imageArticle: String
    let priceArticle: Double
    let quotaArticle: String
}
