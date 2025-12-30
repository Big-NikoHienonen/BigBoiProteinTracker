//
//  BigBoiProteinTrackerApp.swift
//  BigBoiProteinTracker
//
//  Created by Niko Hienonen on 28.12.2025.
//

import SwiftUI

@main
struct BigBoiProteinTrackerApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack {
                BackgroundImage()
                
                
                VStack {
                    
                    ZStack {
                        Text("BIG BOI PROTEIN TRACKER")
                            .chalkText(size: 42)
                            .padding(.horizontal , 400)
                    }
                    .deepShadow()
                    
                    Spacer()
                
                    ProteinTracker()

                    Spacer()
                    
                }
                
            }
        }
    }
}

