//
//  TJTokenFactory.swift
//  TJLexerTests
//
//  Created by Tjienta Vara on 2017-06-15.
//

import Foundation

/** An action to be executed after a rule matches.
 *
* == Context
 * Each lexer-rule is only valid when the Lexer is in a the same context as is assigned to the rule.
 * An action is able to change the context of the lexer. Zero is the default context.
 *
 * == More
 * Sometimes simple pattern matching is not enough to capture all the text to create a value for a token.
 * If you return a TJMoreToken the current matched text is carried forwarded to the next TJLexerAction call.
 *
 * - parameter location: The location of the pattern in the text.
 * - parameter match: The text that matched the pattern.
 * - parameter submatches: The pieces of text that matched the subexpression of the pattern.
 * - parameter more: Text that was previously parsed
 * - return token: The next token to return to the parser.
 * - return switchContext / more: Set the lexer to a new context, a negative context means `more`.
 */
typealias TJLexerAction =  (Substring, [Substring]) -> (TJToken)

