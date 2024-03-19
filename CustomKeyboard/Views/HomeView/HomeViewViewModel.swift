//
//  HomeViewViewModel.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2024-02-06.
//

import Foundation
import SwiftUI

class HomeViewViewModel: ObservableObject {
    @Published var text = ""
    @AppStorage("topBarItems", store: UserDefaults.shared) var topBarItemsArray = [String]()
    
    func saveToUserDefaults() {
        topBarItemsArray.append(text)
//        UserDefaults.shared.synchronize()
    }
}
