//
//  ThirdCypher.swift
//  SpyApp
//
//  Created by Russelle Pineda on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

//The secret value is squared(multiplied to itself).
struct ThirdCypher: Cipher {
    
    func encode(_ plaintext: String, secret: String) -> String? {
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode + (shiftBy * shiftBy)
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            encoded = encoded + shiftedCharacter
        }
        return encoded
    }
    
    func decrypt(_ encrypted: String, secret: String) -> String? {
        
        guard let shiftBy = UInt32(secret) else{
            return nil
        }
        var decrypted = ""
        
        for character in encrypted {
            let unicode = character.unicodeScalars.first!.value
            let shiftedUnicode = unicode
            let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
            decrypted = decrypted + shiftedCharacter
        }
        return decrypted
    }
}
