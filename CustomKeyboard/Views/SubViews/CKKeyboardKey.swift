//
//  CKKeyboardKey.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-11-22.
//

import SwiftUI

enum CapslockKeyPlaceholder: String {
    case shift         = "shift"
    case shiftFill     = "shift.fill"
    case capslockFill  = "capslock.fill"
}

enum KeyPlaceholder: String {
    case caps   = "caps"
    case delete = "delete"
    case emoji  = "emoji"
    case enter  = "return" // Return key
    
    var keyTapped: String {
        switch self {
        case .caps: // Return keyword is omitted beacuse it's not necessary
            "shift.fill"
        case .delete:
            "delete.left.fill"
        case .emoji:
            "face.smiling.inverse"
        case .enter:
            "arrow.turn.down.left"
        }
    }
    
    var keyUntapped: String {
        switch self {
        case .caps:
            "shift"
        case .delete:
            "delete.left"
        case .emoji:
            "face.smiling"
        case .enter:
            "arrow.turn.down.left"
        }
    }
}

struct CKKeyboardKey: View {
    let key             : String
    var capslockKeyImage: CapslockKeyPlaceholder = .shift
    var selectedKeyboard: CKKeyboards            = .lowercaseKeys
    
    var body: some View {
        
        if key.contains("gap") {
            Spacer()
            
        } else {
            Button {} label: {
                switch key {
                    
                case "caps":
                    KeyPlaceholderView(isImage: true, placeholder: capslockKeyImage.rawValue, key: key)
                    
                case "delete", "emoji", "return":
                    KeyPlaceholderView(isImage: true, placeholder: KeyPlaceholder(rawValue: key)!.keyUntapped, key: key)
                    
                default:
                    if key == "space" || key == ".or?" {
                        KeyPlaceholderView(isImage: false, placeholder: key)
                        
                    } else {
                        let updatedKey = capslockKeyImage == .shiftFill || capslockKeyImage == .capslockFill ? key.uppercased() : key.lowercased()
                        KeyPlaceholderView(isImage: false, placeholder: updatedKey)
                    }
                }
            }
        }
    }
}



struct KeyPlaceholderView: View {
    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.verticalSizeClass)   var verticalSizeClass
//    @State private var currentOrientation = UIDevice.current.orientation
    
    let isImage    : Bool
    let placeholder: String  // Placeholder is used for images
    var key        : String? // Key is used for characters, eg: a, b, c, 1, 2, 3, @, $...
    
    // 53 -> because the padding on the keyboard is 8 (leading + trailing)
    // So 8 + the gap between the keys
    // There are 9 gaps, each of length 5
    // So 8 + (9 * 5) = 53
    // Dividing by 10 beacuse that's the maximum nuumber of keys for a row
//    @State var normalKeyWidth = (UIScreen.main.bounds.width - 53) / 10
    //    @State var normalKeyWidth = UIScreen.main.bounds.width * 0.05
//    @State var normalKeyHeight = UIScreen.main.bounds.height * 0.048
    
    @State var isPressing = false
    
    var body: some View {
        ZStack {
            if isImage {
                Image(systemName: placeholder)
            } else {
                if placeholder.contains("or") {
                    Text(splitCharacters(key: placeholder).0)
                        .frame(width: keyWidth(), height: keyHeight())
                        .overlay(alignment: .topTrailing) {
                            Text(splitCharacters(key: placeholder).1)
                                .foregroundStyle(.gray)
                                .offset(x: -5, y: 0)
                        }
                    
                } else {
                    Text(placeholder)
                }
            }
        }
        //            .frame(width: keyWidth(), height: normalKeyHeight)
        .frame(width: keyWidth(), height: keyHeight())
        .onAppear {
            print(keyWidth())
        }
        .foregroundStyle(.foreground)
        .background(keyBackground())
        .clipShape(RoundedRectangle(cornerRadius: 6))
        .shadow(color: .gray, radius: 0, x: 0, y: isPressing ? 0 : 2) // Change shadow color to black for dark mode
        .animation(.linear(duration: 0.1), value: isPressing)
        .onLongPressGesture(minimumDuration: .greatestFiniteMagnitude) {}
        onPressingChanged: { isPressing in
            self.isPressing = isPressing
        }
        
    }
    
    func keyWidth() -> CGFloat {
        
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            // Adjust layout for PORTRAIT orientation
            var width = UIDevice.deviceModel.widthPortrait
            
            if placeholder == "space" {
                // 32 -> because the leading and trailing padding is 8 (4 + 4)
                // There are 4 gaps, each of length 6 -> (6 for portrait, 5 for landscape)
                // (4 * 6) + 8 = 32
                let spaceKeyWidth = UIScreen.main.bounds.width - ((width * 4) + 32)
                width = spaceKeyWidth
            }
            return width
            
        } else {
            // Adjust layout for LANDSCAPE orientation
            var width = UIDevice.deviceModel.widthLandscape
            
            if placeholder == "space" {
                // 30 -> because the leading and trailing padding is 8 (4 + 4)
                // There are 5 gaps, each of length 5
                // (5 * 6) + 8 = 38
                let spaceKeyWidth = 346.0
                width = spaceKeyWidth
            }
            
            return width
        }
    }
    
    func keyHeight() -> CGFloat  {
        if horizontalSizeClass == .compact && verticalSizeClass == .regular {
            // Adjust layout for PORTRAIT orientation
            let height = UIDevice.deviceModel.heightPortrait
            return height
            
        } else {
            // Adjust layout for LANDSCAPE orientation
            let height = UIDevice.deviceModel.heightLandscape
            return height
        }
    }
    
    func keyBackground() -> Color {
        // Cannot use switch because this check with both key and placeholder
        if key == "caps" || key == "delete" || key == "emoji" || placeholder == "#+=" || placeholder == "123" || placeholder == "ABC" || placeholder == "abc" || key == "return" {
            
            if isPressing {
                return .gray
            } else {
                return CKColors.buttonBGColor
            }
        } else {
            if isPressing {
                return .gray
            } else {
                return CKColors.clipboardItemBGColor
            }
        }
    }
    
    // To split the 2 characters, eg: ".or?"
    func splitCharacters(key: String) -> (String, String) {
        let firstChar = String(key.first!)
        let lastChar = String(key.last!)
        
        return (firstChar, lastChar)
    }
}

#Preview {
    CKKeyboardKey(key: "delete")
}
