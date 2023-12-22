//
//  KeyboardViewController.swift
//  CustomiOSKeyboard
//
//  Created by Abdullah Ajmal on 2023-12-22.
//

import UIKit
import SwiftUI

class KeyboardViewController: UIInputViewController {
    
    var hostingController = UIHostingController(rootView: CustomKeyboardView())
//    let keyboardState     = KeyboardState()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        checkDeviceModel()
    }
    
    func checkDeviceModel() {
        let deviceModelString = UIDevice.modelName.replacingOccurrences(of: " ", with: "_")
        if let deviceModel = CKKeySize(rawValue: deviceModelString) {
            
            UIDevice.deviceModel = deviceModel // If device model is valid then call the hosting controller
            configureHostingViewController()
        } else {
            print("Device not recognized!")
        }
    }
    
    
    func configureHostingViewController() {
        
        let rootView =  CustomKeyboardView(insertText: { text in
            self.textDocumentProxy.insertText(text)
            self.capitalizeKeys()
            
        }, insertPeriod: {
            self.insertPeriodAfterDoubleSpaces()
            
        }, deleteText: {
            self.textDocumentProxy.deleteBackward()
            self.capitalizeKeys()
            
        }, nextKeyboard: {
            self.advanceToNextInputMode()
        })
        
        hostingController = UIHostingController(rootView: rootView)
        
        addChild(hostingController)
        view.addSubview(hostingController.view)
        
        // To remove the default bg of the content view
        // This is done so that the default color of the keyboard will be visible
        hostingController.view.backgroundColor = UIColor.clear
        
        // Set up constraints to make your SwiftUI view fill the entire keyboard area.
        hostingController.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            hostingController.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            hostingController.view.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            hostingController.view.topAnchor.constraint(equalTo: view.topAnchor),
            hostingController.view.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        hostingController.didMove(toParent: self)
    }
    
    
    func capitalizeKeys() {
        let text = textDocumentProxy.documentContextBeforeInput
        
        if text == nil { // Capitalization when input field is empty
            KeyboardState.shared.shouldCapitalizeLetters = true
            
        } else if text?.suffix(2) == ". " || text?.suffix(2) == "? " || text?.suffix(2) == "! " { // Capitalization after punctuations (.?!)
            KeyboardState.shared.shouldCapitalizeLetters = true
            
        } else if text?.suffix(1) == "\n" { // Capitalization after new line
            KeyboardState.shared.shouldCapitalizeLetters = true
            
        } else {
            KeyboardState.shared.shouldCapitalizeLetters = false
        }
    }
    
    // Insert period after double tapping space bar
    func insertPeriodAfterDoubleSpaces() {
        let text = textDocumentProxy.documentContextBeforeInput
        
        // If there is text in the input field
        // And the last 2 characters is two spaces -> "  "
        if text != nil && text?.suffix(2) != "  " {
            textDocumentProxy.adjustTextPosition(byCharacterOffset: -1) // Adjusting by -1 cuz double tap adds 2 spaces
            textDocumentProxy.insertText(". ") // Adding a space character with a period because double tap should add a period and a space
            
        } else {
            textDocumentProxy.insertText(" ")
        }
    }
    
    
    
//    override func textWillChange(_ textInput: UITextInput?) {
//        super.textWillChange(textInput)
//        capitalizeKeys()
        
//        let precedingText = textDocumentProxy.documentContextBeforeInput ?? ""
//        let followingText = textDocumentProxy.documentContextAfterInput ?? ""
//        let selectedText = textDocumentProxy.selectedText ?? ""
//        print("Preceding: \(precedingText)")
//        print("selected: \(selectedText)")
//        print("following: \(followingText)")
        
//        let fullText = "\(precedingText)\(selectedText)\(followingText)"
//        print(fullText)
        
        // If full text is empty then it should be capitalised (This is done)
        // Check if there's any text selected
//    }
    
    
    override func textDidChange(_ textInput: UITextInput?) {
        super.textDidChange(textInput)
        
        let selectedText = textDocumentProxy.selectedText
        
        if selectedText == nil/* && precedingText != nil*/ { // If there is no text selected, call capitalizeKeys
            capitalizeKeys()
        }
    }
}
