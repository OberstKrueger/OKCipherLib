/// Implementation of the Scream Cipher
public final class ScreamCipher: Cipher {
    private let table: [Character: Character] = [
        "A": "A",
        "B": "Ȧ",
        "C": "A̧",
        "D": "A̲",
        "E": "Á",
        "F": "A̮",
        "G": "A̋",
        "H": "A̰",
        "I": "Ả",
        "J": "A̓",
        "K": "Ạ",
        "L": "Ă",
        "M": "Ǎ",
        "N": "Â",
        "O": "Å",
        "P": "A̯",
        "Q": "A̤",
        "R": "Ȃ",
        "S": "Ã",
        "T": "Ā",
        "U": "Ä",
        "V": "À",
        "W": "Ȁ",
        "X": "A̽",
        "Y": "A̦",
        "Z": "Ⱥ",

        "a": "a",
        "b": "ȧ",
        "c": "a̧",
        "d": "a̲",
        "e": "á",
        "f": "a̮",
        "g": "a̋",
        "h": "a̰",
        "i": "ả",
        "j": "a̓",
        "k": "ạ",
        "l": "ă",
        "m": "ǎ",
        "n": "â",
        "o": "å",
        "p": "a̯",
        "q": "a̤",
        "r": "ȃ",
        "s": "ã",
        "t": "ā",
        "u": "ä",
        "v": "à",
        "w": "ȁ",
        "x": "a̽",
        "y": "a̦",
        "z": "ⱥ",
    ]

    private let reverseTable: [Character: Character]

    public let name: String = "Scream Cipher"

    public let requiresKey: Bool = false

    public init() {
        reverseTable = Dictionary(uniqueKeysWithValues: table.map { ($1, $0) })
    }

    public func decrypt(text: String, key: String?) throws -> String {
        return String(text.map {
            return reverseTable[$0] ?? $0
        })
    }
    
    public func encrypt(text: String, key: String?) throws -> String {
        return String(text.map {
            return table[$0] ?? $0
        })
    }
    
    public func validKey(_ key: String) -> Bool {
        return true
    }
}
