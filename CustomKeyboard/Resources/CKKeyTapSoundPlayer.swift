//
//  CKKeyTapSoundPlayer.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-12-05.
//

import AudioToolbox

class CKKeyTapSoundPlayer {
    
    
    let clickSound   : SystemSoundID = 1123
    let modifierSound: SystemSoundID = 1156
    let deleteSound  : SystemSoundID = 1155
    
    func playClickSound() {
        AudioServicesPlaySystemSound(clickSound)
    }
    
    func playModifierSound() {
        AudioServicesPlaySystemSound(modifierSound)
    }
    
    func playDeleteSound() {
        AudioServicesPlaySystemSound(deleteSound)
    }
}
