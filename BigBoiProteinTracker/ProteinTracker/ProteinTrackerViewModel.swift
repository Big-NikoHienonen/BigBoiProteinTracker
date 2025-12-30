//
//  ProteinTrackerViewModel.swift
//  BigBoiProteinTracker
//
//  Created by Niko Hienonen on 30.12.2025.
//

import SwiftUI

struct DailyProtein: Codable {
    var amount: Int
    var date: Date
}

class ProteinTrackerViewModel: ObservableObject {
    @Published var totalProtein: Int = 0
    
    private let userDefaultsKey = "dailyProteinAmount"
    
    init() {
        loadProtein()
    }
    
    func addProtein(_ amount: Int) {
        totalProtein += amount
        saveProtein()
    }
    
    private func saveProtein() {
        let dailyData = DailyProtein(amount: totalProtein, date: Date())
        if let encodedData = try? JSONEncoder().encode(dailyData) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
            print("Data saved: \(totalProtein)g")
        }
    }
    
    func resetProtein() {
        totalProtein = 0
        saveProtein()
    }
    
    private func loadProtein() {
        guard let savedData = UserDefaults.standard.data(forKey: userDefaultsKey),
              let decodedData = try? JSONDecoder().decode(DailyProtein.self, from: savedData) else {
            // No data found, so we start at 0.
            return
        }
        
        // Check if the saved data is from today.
        if Calendar.current.isDateInToday(decodedData.date) {
            // If it's from today, use that value.
            totalProtein = decodedData.amount
            print("Data loaded for today: \(totalProtein)g")
        } else {
            // If it's from a previous day, reset to 0 and save.
            print("Data is from a previous day. Resetting to 0.")
            totalProtein = 0
            saveProtein()
        }
    }

}
