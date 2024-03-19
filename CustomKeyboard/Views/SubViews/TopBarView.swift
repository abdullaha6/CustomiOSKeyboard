//
//  TopBarView.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-11-25.
//

import SwiftUI
import UIKit

struct TopBarView: View {
    var insertText   : (String) -> () = { _ in }
    
    @AppStorage("topBarItems", store: UserDefaults.shared) var topBarItemsArray = [String]()
    private let screenWidth = UIScreen.main.bounds.width - 8
    
    let rows = [
        GridItem(.flexible())
    ]
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, content: {
                
                ForEach(topBarItemsArray, id: \.self) { text in
                    TopBarButton(text: text)
                        .onTapGesture {
                            insertText(text)
                        }
                }
            })
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
        .frame(width: screenWidth, height: 55)
    }
}


#Preview {
    TopBarView()
}

struct TopBarButton: View {
    let text: String
    
    var body: some View {
        
        Text(text)
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(CKColors.clipboardItemBGColor)
            .clipShape(.rect(cornerRadius: 5))
    }
}
