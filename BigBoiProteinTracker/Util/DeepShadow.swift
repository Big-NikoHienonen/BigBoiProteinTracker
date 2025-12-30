//
//  DeepShadow.swift
//  BigBoiProteinTracker
//
//  Created by Niko Hienonen on 30.12.2025.
//

import SwiftUI

struct DeepShadowModifier: ViewModifier {
    func body(content: Content)-> some View {
        content
            .shadow(color: .black, radius: 2)
            .shadow(color: .black, radius: 5)
            .shadow(color: .black, radius: 10)
            .shadow(color: .black, radius: 15)
            .shadow(color: .black, radius: 20)
            .shadow(color: .black, radius: 25)
            .shadow(color: .black, radius: 30)
    }
}

extension View {
    func deepShadow() -> some View {
        self.modifier(DeepShadowModifier())
    }
}
