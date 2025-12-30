//
//  ChalkText.swift
//  BigBoiProteinTracker
//
//  Created by Niko Hienonen on 30.12.2025.
//

import SwiftUI

struct ChalkTextModifier: ViewModifier {
    let size: CGFloat
    func body(content: Content) -> some View {
        content
            .font(
                .custom("Chalkduster", size: size))
            .foregroundColor(.white)
            .multilineTextAlignment(.center)
    }
}

extension View {
    public func chalkText(size: CGFloat = 24) -> some View {
        self.modifier(ChalkTextModifier(size: size))
    }
}

