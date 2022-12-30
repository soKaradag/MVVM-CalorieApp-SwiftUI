//
//  CaloriesApp.swift
//  Calories
//
//  Created by Serdar Onur KARADAĞ on 10.11.2022.
//

import SwiftUI

@main
struct CaloriesApp: App {
    
    @StateObject var VM = foodViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(VM)
        }
    }
}
