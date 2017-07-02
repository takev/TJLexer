//
//  TJLexerRule.swift
//  TJLexerTests
//
//  Created by Tjienta Vara on 2017-06-15.
//

import Foundation

struct TJLexerRule {
    let context : Int
    let pattern : NSRegularExpression
    let action : TJLexerAction

    init(_ context: Int, _ pattern: String, action: @escaping TJLexerAction) throws {
        self.context = context
        self.pattern = try NSRegularExpression(pattern: pattern, options: [.dotMatchesLineSeparators, .anchorsMatchLines, .useUnicodeWordBoundaries])
        self.action = action
    }

    init(_ pattern: String, action: @escaping TJLexerAction) throws {
        self.context = 0
        self.pattern = try NSRegularExpression(pattern: pattern, options: [.dotMatchesLineSeparators, .anchorsMatchLines, .useUnicodeWordBoundaries])
        self.action = action
    }

    func textMatches(text: String, at: String.Index) -> Bool {
        let match = pattern.firstMatch(in: text, options: [], range: at ..< text.endIndex)
    }
}
