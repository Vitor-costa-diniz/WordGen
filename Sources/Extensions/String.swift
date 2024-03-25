//
//  File.swift
//  
//
//  Created by Vitor Costa on 25/03/24.
//

import Foundation

extension String {
    /// Checks if two strings are equal, disregarding accentuation differences.
    /// - Parameter other: The other string to compare.
    /// - Returns: `true` if the strings are considered equal, ignoring accentuation; otherwise, `false`.
    func isEqualIgnoringAccents(_ other: String) -> Bool {
        return self.folding(options: .diacriticInsensitive, locale: .current) == other.folding(options: .diacriticInsensitive, locale: .current)
    }
}
