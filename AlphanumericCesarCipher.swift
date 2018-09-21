//
//  AlphanumericCesarCipher.swift
//  SpyApp
//
//  Created by Russelle Pineda on 9/20/18.
//  Copyright © 2018 Axel Ancona Esselmann. All rights reserved.
//

import Foundation

struct AlphanumericCesarCipher: Cipher {
    
    
    func encode(_ plaintext: String, secret: String) -> String? {
        
        
        guard let shiftBy = UInt32(secret) else {
            return nil
        }
        var encoded = ""
        
        for character in plaintext {
            let unicode = character.unicodeScalars.first!.value
            var shiftedUnicode = unicode + shiftBy
            
            if (unicode > 64 && unicode < 91) || (unicode > 47 && unicode < 58) {
                
                if (unicode > 96 && unicode < 123) {
                    shiftedUnicode = shiftedUnicode - 32
                }
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                encoded = encoded + shiftedCharacter
            }
            else {
                return "Not an Alphanumeric character!"
            }
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
            var shiftedUnicode = unicode - shiftBy
            
            if (unicode > 64 && unicode < 91) || (unicode > 47 && unicode < 58) {
                
                if (unicode > 96 && unicode < 123) {
                    shiftedUnicode = shiftedUnicode - 32
                }
                
                let shiftedCharacter = String(UnicodeScalar(UInt8(shiftedUnicode)))
                decrypted = decrypted + shiftedCharacter            }
            else {
                return "Not an Alphanumeric character!"
            }
        }
        return decrypted
    }
}

