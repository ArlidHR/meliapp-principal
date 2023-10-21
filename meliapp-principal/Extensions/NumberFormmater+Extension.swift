//
//  NumberFormmater+Extension.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 18/10/23.
//

import Foundation

extension NumberFormatter {
    public func stringColCurrency (
        number: NSNumber,
        localeIdentifier: String
    ) -> String {
        locale = Locale(identifier: localeIdentifier)
        numberStyle = .currencyAccounting
        return  string(from: number)!
    }
}
