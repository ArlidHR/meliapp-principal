//
//  String+Extension.swift
//  meliapp-principal
//
//  Created by Arlid Henao Rueda on 18/10/23.
//

import Foundation

extension String {
    public func replacingLastOccurrenceOfString(
        _ string: String,
        with substring: String,
        caseInsensitive: Bool = true) -> String {
        let options: String.CompareOptions
        if caseInsensitive {
            options = [.backwards, .caseInsensitive]
        } else {
            options = [.backwards]
        }
        if let range = self.range(
            of: string,
            options: options,
            range: nil,
            locale: nil
        ) {
            return self.replacingCharacters(
                in: range,
                with: substring
            )
        }
        return self
    }
}
