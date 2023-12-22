//
//  CKKeys.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-11-23.
//

import Foundation

enum CKKeyboards {
    case lowercaseKeys
    case numberKeys
    case symbolKeys
    
    var selectecKeyboard: [[String]] {
        switch self {
        case .lowercaseKeys: // Return keyword is omitted beacuse it's not necessary
            CKKeys.lowercaseKeys
        case .numberKeys:
            CKKeys.numberKeys
        case .symbolKeys:
            CKKeys.symbolKeys
        }
    }
}

struct CKKeys {
    
    static let lowercaseKeys: [[String]] = [
        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
        ["q", "w", "e", "r", "t", "y", "u", "i", "o", "p"],
        ["a", "s", "d", "f", "g", "h", "j", "k", "l"],
        ["caps", "gap1", "z", "x", "c", "v", "b", "n", "m", "gap2", "delete"],
        ["!#1","emoji", ",", "space", ".or?","return"]
    ]
    
    static let numberKeys: [[String]] = [
        ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
        ["-", "/", ":", ";", "(", ")", "$", "&", "@", "\""],
        ["#+=", "gap1", ".", ",", "?", "!", "'", "gap2", "delete"],
        ["abc","emoji", ",", "space", ".","return"]
    ]
    
    static let symbolKeys: [[String]] = [
        ["1", "2", "3", "4", "5", "6", "7", "8", "9", "0"],
        ["[", "]", "{", "}", "#", "%", "^", "*", "+", "="],
        ["_", "\\", "|", "~", "<", ">", "€", "£", "¥", "•"],
        ["123", "gap1", ".", ",", "?", "!", "'", "gap2", "delete"],
        ["abc","emoji", ",", "space", ".","return"]
    ]
}
