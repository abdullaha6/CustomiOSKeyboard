//
//  CustomButton.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-10-30.
//

import SwiftUI

struct CustomButton: View {
    var imageName: String
    var action   : () -> Void
    
    var body: some View {
        Button(action: action) {
            Image(systemName: imageName)
                .foregroundStyle(.foreground)
                .frame(width: 50, height: 50)
                .background(CKColors.buttonBGColor)
                .clipShape(RoundedRectangle(cornerSize: CGSize(width: 6, height: 6)))
        }
    }
}
