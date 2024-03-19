//
//  HomeView.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2024-02-06.
//

import SwiftUI

public extension UserDefaults {
    static let shared = UserDefaults(suiteName: "group.com.abdullahajmal.CustomKeyboard")!
}

struct HomeView: View {
    @ObservedObject private var viewModel = HomeViewViewModel()
    
    var body: some View {
        VStack(alignment: .center) {
//            Text(viewModel.topBarItemsArray[0])
            
            TopBarView()
                .background(Color(CKColors.buttonBGColor))
            
            TextField("Enter your text", text: $viewModel.text)
                .padding()
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.foreground, lineWidth: 1)
                )
                .padding()
            
            Button(action: {
                viewModel.saveToUserDefaults()
            }, label: {
                Text("Save")
                    .padding(.horizontal, 20)
                    .padding(.vertical, 10)
                    .foregroundStyle(CKColors.clipboardItemBGColor)
                    .background(.foreground)
                    .clipShape(.rect(cornerRadius: 5))
            })
        }
    }
}

extension Array: RawRepresentable where Element: Codable {
    public init?(rawValue: String) {
        guard let data = rawValue.data(using: .utf8),
              let result = try? JSONDecoder().decode([Element].self, from: data)
        else { return nil }
        self = result
    }
    
    public var rawValue: String {
        guard let data = try? JSONEncoder().encode(self),
              let result = String(data: data, encoding: .utf8)
        else {
            return "[]"
        }
        return result
    }
}

#Preview {
    HomeView()
}
