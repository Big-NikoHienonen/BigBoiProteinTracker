//
//  ProteinTracker.swift
//  BigBoiProteinTracker
//
//  Created by Niko Hienonen on 30.12.2025.
//

import SwiftUI

struct ProteinTracker: View {
    @StateObject private var viewModel = ProteinTrackerViewModel()
    
    @State private var customAmount: String = ""
    
    private enum FocusField {
        case customAmount
    }
    
    @FocusState private var focusedField: FocusField?
    
    var body: some View {
        VStack {
            
            Spacer()
            
            Text("Total protein today:")
                .chalkText()
            Text("\(viewModel.totalProtein)g / 200g")
                .chalkText()
            
            Text("Quick Add")
                .font(.headline)
            
            HStack(spacing: 15) {
                QuickAddButton(amount: 10, action: viewModel.addProtein)
                QuickAddButton(amount: 20, action: viewModel.addProtein)
                QuickAddButton(amount: 40, action: viewModel.addProtein)
            }
            
            
            // --- Custom Amount Input ---
            Text("Custom Amount")
                .font(.headline)
            
            HStack {
                TextField("e.g., 25", text: $customAmount)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .keyboardType(.numberPad) // Show number pad for easier input
                    .frame(width: 150)
                    .focused($focusedField, equals: .customAmount)
                
                Button("Add") {
                    if let amount = Int(customAmount) {
                        viewModel.addProtein(amount)
                    }
                    customAmount = ""
                    
                    focusedField = nil
                }
                .padding(.horizontal, 16)
                .padding(.vertical, 6)
                .background(Color.red)
                .chalkText(size: 18)
                .cornerRadius(10)
        
            }
            
            Spacer()
            
            Button("Reset protein amount") {
                viewModel.resetProtein()
            }
            .padding(.horizontal, 16)
            .padding(.vertical, 6)
            .background(Color.red)
            .chalkText(size: 18)
            .cornerRadius(10)
        }
        .deepShadow()
    }
}

// A helper view to avoid repeating button code.
struct QuickAddButton: View {
    let amount: Int
    let action: (Int) -> Void
    
    var body: some View {
        Button("+\(amount)g") {
            action(amount)
        }
        .font(.title2)
        .padding(.horizontal)
        .frame(height: 50)
        .background(Color.red)
        .foregroundColor(.white)
        .clipShape(Capsule())
    }
}

#Preview {
    ProteinTracker()
}
