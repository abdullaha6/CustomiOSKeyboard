//
//  CustomKeyboardView.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-11-22.
//

import SwiftUI

struct CustomKeyboardView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    
                    private let tapSoundPlayer = CKKeyTapSoundPlayer()
    @ObservedObject private var viewModel      = CustomKeyboardViewViewModel()
    @StateObject    private var keyboardState  = KeyboardState.shared
    
    var insertText   : (String) -> () = { _ in }
    var insertPeriod : ()       -> () = {}
    var deleteText   : ()       -> () = {}
    var nextKeyboard : ()       -> () = {}
    
    @State private var keyboards: CKKeyboards = .lowercaseKeys
//    private let keyboardWidth = UIScreen.main.bounds.width - 8
    
    @State private var isPressing  = false
    @State private var isUppercase = false
    @State private var capslockKeyImage: CapslockKeyPlaceholder = .shift
    
    var body: some View {
        
        VStack(spacing: 10) {
            Spacer()
                .onAppear {
                    print(UIDevice.deviceModel)
                }
            
            ForEach(keyboards.selectecKeyboard, id: \.self) { row in
                HStack(spacing: horizontalSizeClass == .compact ? 6 : 5) { // 5 for landscape
                    
                    ForEach(row, id: \.self) { key in
                        CKKeyboardKey(key: key, capslockKeyImage: capslockKeyImage, selectedKeyboard: keyboards)
                            .simultaneousGesture(
                                // Long press start
                                LongPressGesture(/*minimumDuration: 0.3*/)
                                    .onEnded { _ in
                                        if key == "delete" {
                                            self.isPressing = true
                                            startDelete()
                                            
                                        } else if key == ".or?" {
                                            insertText("?")
                                        }
                                    }
                            ) // Long press end
                            .onLongPressGesture(perform: {}, onPressingChanged: { isPressing in
                                if !isPressing {
                                    self.isPressing = false
                                }
                            })
                            .simultaneousGesture(
                                // Single taps
                                TapGesture().onEnded {
                                    isPressing = false
                                    inputText(key: key)
                                }
                                // Double Tap
                                    .sequenced(before: TapGesture(count: 2).onEnded {
                                        if key == "caps" {
                                            isUppercase = true
                                            capslockKeyImage = .capslockFill
                                        }  else if key == "space" {
                                            insertPeriod()
                                        } else {
                                            inputText(key: key)
                                        }
                                    }
                                              )
                            )
                    }
                }
                
            }
        }
        .onReceive(keyboardState.$shouldCapitalizeLetters, perform: { shouldCapitalize in
            if shouldCapitalize {
                isUppercase = true
                capslockKeyImage = .shiftFill
            } else {
                if capslockKeyImage != .capslockFill { // TODO: Check this properly
                    isUppercase = false
                    capslockKeyImage = .shift
                }
            }
        })
        .padding(.bottom, 5)
        .fixedSize()
//        .frame(width: keyboardWidth)
    }
    
    func inputText(key: String) {
        
        // TODO: Make variables out of these string values
        switch key {
            // Return keyword is omitted beacuse it's not necessary
        case "caps":
            tapSoundPlayer.playModifierSound()
            isUppercase.toggle()
            capslockKeyImage = isUppercase ? .shiftFill : .shift
            
            //            if capslockKeyImage == .shift { capslockKeyImage = .shiftFill } else if capslockKeyImage == .shiftFill { capslockKeyImage = .shift } // Toggling
            //            capslockKeyImage = capslockKeyImage == .shiftFill ? .shiftFill : .shift
        case "#+=":
            tapSoundPlayer.playModifierSound()
            keyboards = .symbolKeys
            
        case "123":
            tapSoundPlayer.playModifierSound()
            keyboards = .numberKeys
            
        case "delete":
            tapSoundPlayer.playDeleteSound()
            deleteText()
            
        case "!#1":
            tapSoundPlayer.playModifierSound()
            keyboards = .numberKeys
            
        case "abc":
            tapSoundPlayer.playModifierSound()
            keyboards = .lowercaseKeys
            
        case "emoji":
            nextKeyboard()
            
        case "space":
            tapSoundPlayer.playModifierSound()
            insertText(" ")
            
        case ".or?":
            tapSoundPlayer.playClickSound()
            insertText(".")
            
        case "return":
            tapSoundPlayer.playModifierSound()
            insertText("\n")
            
        default:
            tapSoundPlayer.playClickSound()
            insertText(capslockKeyImage == .shiftFill || capslockKeyImage == .capslockFill ? key.uppercased() : key.lowercased())
            
            // TODO: Add this to all the cases in the switch except for "caps"
            // To switch to lowercase after user inputs a character
            // This is when you just tap the capslock key to capitliaze one letter
            if capslockKeyImage == .shiftFill  && isUppercase {
                capslockKeyImage = .shift
                isUppercase = false
                keyboardState.shouldCapitalizeLetters = false
            }
        }
    }
    
    func startDelete() {
        // Timer to delete text repeatedly as long as the button is held
        Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { timer in
            if self.isPressing {
                tapSoundPlayer.playDeleteSound()
                deleteText()
                
            } else {
                timer.invalidate()
            }
        }
    }
}

#Preview {
    CustomKeyboardView()
}
