import Foundation

struct TJLexer {
    let rules: [TJLexerRule]

    init(_ rules: [TJLexerRule]) {
        self.rules = rules
    }

    func parseText(text: String) -> TJTokenizer {
        return TJTokenizer(lexer:self, text:text)
    }

    func parseText(text: String, at index: String.Index) -> TJTokenizer {
        return TJTokenizer(lexer:self, text:text, at:index)
    }
}

struct TJTokenizer {
    let lexer: TJLexer
    let text: String
    var index: String.Index
    var tokenQueue = Array<TJToken>()

    init(lexer: TJLexer, text: String) {
        self.lexer = lexer
        self.text = text
        self.index = text.startIndex
    }

    init(lexer: TJLexer, text: String, at index: String.Index) {
        self.lexer = lexer
        self.text = text
        self.index = index
    }

    /** Parse a token from the text.
     * The token may be added to the queue.
     */
    mutating func parseToken() {

    }

    /** Get the token.
     * The token is popped from the queue.
     */
    mutating func getToken() -> TJToken {
        while tokenQueue.count < 1 {
            parseToken()
        }

        let token = tokenQueue[0]
        tokenQueue.remove(at: 0)
        return token
    }

    /** Look ahead for a token further in the text.
     * The token is not popped from the queue.
     */
    mutating func lookAhead(_ tokenIndex: Int = 0) -> TJToken {
        while tokenQueue.count < (tokenIndex + 1) {
            parseToken()
        }

        return tokenQueue[tokenIndex]
    }
}
