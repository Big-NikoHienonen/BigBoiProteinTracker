//
//  LandingBackgroundImage.swift
//  BigBoiProteinTracker
//
//  Created by Niko Hienonen on 29.12.2025.
//

import SwiftUI

struct BackgroundImage: View {
    var body: some View {
        Image("mutant")
            .resizable()
            .scaledToFill()
            .edgesIgnoringSafeArea(.vertical)
        
    }
}

#Preview {
    BackgroundImage()
}
