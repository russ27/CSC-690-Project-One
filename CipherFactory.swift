import Foundation

struct CipherFactory {

    private var ciphers: [String: Cipher] = [
        "Ceasar": CeaserCipher(),
        "Alphanumeric": AlphanumericCesarCipher(),
        "Second": SecondCipher(),
        "Third": ThirdCypher(),
        
    ]

    func cipher(for key: String) -> Cipher {
        return ciphers[key]!
    }
}
