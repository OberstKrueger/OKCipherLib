import Foundation

/// A protocol for implementing various cipher encryption and decryption schemes.
public protocol Cipher {
    /// The name of the cipher algorithm.
    var name: String { get }

    /// Whether the cipher protocol requires a key for encyprtion and decryption.
    var requiresKey: Bool { get }

    /// Decrypts the text with an optional user-provided key.
    /// - Parameters:
    ///     - text: Ciphertext in UTF-8 format
    ///     - key: An optional cipher key.
    /// - Returns: Decrypted plaintext in UTF-8 format.
    /// - Throws: CipherError if invalid key or input validation occurred.
    /// - Note: If the cipher does not require a key, the input key is ignored.
    func decrypt(text: String, key: String?) throws -> String

    /// Encrypts the text with an optional user-provided key.
    /// - Parameters:
    ///     - text: Plaintext in UTF-8 format
    ///     - key: An optional cipher key.
    /// - Returns: Encrypted ciphertext in UTF-8 format.
    /// - Throws: CipherError if invalid key or input validation occurred.
    /// - Note: If the cipher does not require a key, the input key is ignored.
    func encrypt(text: String, key: String?) throws -> String

    /// Checks whether the key provided is valid for the cipher.
    /// - Parameters:
    ///     - key: The cipher key.
    /// - Returns: "true" if the key is valid, "false" if it is not valid.
    func validKey(_ key: String) -> Bool
}

/// Errors during cipher encryption and decryption
enum CipherError: Error, LocalizedError {
    /// Throws when a key is required but one was not provided.
    case keyRequired

    /// Throws when invalid characters are in the user input.
    case invalidInput

    /// Throws when the user-provided key is invalid for the cipher.
    case invalidKey

    /// Throws when the output text is not valid for decrypting.
    case invalidOutput

    /// Descriptive error messages.
    var errorDescription: String? {
        switch self {
        case .keyRequired:
            return "A key is required to encrypt or decrypt text."
        case .invalidInput:
            return "The input text is invalid."
        case .invalidKey:
            return "The provided key is invalid."
        case .invalidOutput:
            return "The output text is invalid for decryption."
        }
    }
}
