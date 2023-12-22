//
//  CustomKeyboardViewViewModel.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-11-22.
//

import Foundation

class KeyboardState: ObservableObject {
    static let shared = KeyboardState() // Makes this a singleton
    
    @Published var shouldCapitalizeLetters = false
    
//    func runFunc() {
//        print(shouldCapitalizeLetters)
//    }
}

class CustomKeyboardViewViewModel: ObservableObject {
    
    func inputText(key: String, action: () -> Void) {
        print(key)
        if key != "Shift" && key != "Delete" && key != "!#1" && key != "Emoji" && key != "Space" && key != "Return" {
            action()
        }
    }
}
