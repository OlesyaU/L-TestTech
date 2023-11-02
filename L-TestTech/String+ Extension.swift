//
//  String+ Extension.swift
//  L-TestTech
//
//  Created by Олеся on 29.10.2023.
//

import Foundation

extension String {

    func applyPatternOnNumbers(pattern: String, replacementCharacter: Character) -> String {
        var pureNumber = self.replacingOccurrences( of: "[^0-9]", with: "", options: .regularExpression)

        for index in 0 ..< pattern.count {
            guard index < pureNumber.count else { return pureNumber }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            pureNumber.insert(patternCharacter, at: stringIndex)
        }
        return pureNumber
    }

    func applyPatternOnPassword(pattern: String, replacementCharacter: Character) -> String {
        var purePassword = self.replacingOccurrences( of: "[^A-Za-z0-9]$", with: "", options: .regularExpression)
        for index in 0 ..< pattern.count {
            guard index < purePassword.count else { return purePassword }
            let stringIndex = String.Index(utf16Offset: index, in: pattern)
            let patternCharacter = pattern[stringIndex]
            guard patternCharacter != replacementCharacter else { continue }
            purePassword.insert(patternCharacter, at: stringIndex)
        }
        return purePassword
    }
}
