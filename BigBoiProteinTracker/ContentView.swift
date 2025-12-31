//
//  ContentView.swift
//  BigBoiProteinTracker
//
//  Created by Niko Hienonen on 30.12.2025.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            BackgroundImage()
            
            
            VStack {
                
                ZStack {
                    Text("BIG BOI PROTEIN TRACKER")
                        .chalkText(size: 16)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 250)
                        
                }
                .deepShadow()
                
                Spacer()
            
                ProteinTracker()

                Spacer()
                
            }
            
        }
        
    }
}

#Preview {
    ContentView()
}
