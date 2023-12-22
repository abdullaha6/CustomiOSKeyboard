//
//  TestView.swift
//  CustomKeyboard
//
//  Created by Abdullah Ajmal on 2023-11-25.
//

import SwiftUI
import UIKit

//struct DeviceRotationViewModifier: ViewModifier {
//    let action: (UIDeviceOrientation) -> Void
//    
//    func body(content: Content) -> some View {
//        content
//            .onAppear()
//            .onReceive(NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)) { _ in
//                action(UIDevice.current.orientation)
//            }
//    }
//}
//
//// A View wrapper to make the modifier easier to use
//extension View {
//    func onRotate(perform action: @escaping (UIDeviceOrientation) -> Void) -> some View {
//        self.modifier(DeviceRotationViewModifier(action: action))
//    }
//}

// An example view to demonstrate the solution
struct TestView: View {
    var body: some View {
        Text("H")
    }
}


#Preview {
    TestView()
}
