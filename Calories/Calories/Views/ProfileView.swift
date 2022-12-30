//
//  ProfileVİew.swift
//  Calories
//
//  Created by Serdar Onur KARADAĞ on 12.11.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @EnvironmentObject var VM: foodViewModel
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 30){
                Text("TODAY'S TOTALS")
                    .font(.system(size: 35, weight: .bold, design: .monospaced))
                VStack(alignment: .leading){
                    Text("Calorie: \(Int(VM.totalCalorieToday)) kcal")
                    Text("Protein: \(Int(VM.totalProteinToday)) gr")
                    Text("Carb: \(Int(VM.totalCarbToday)) gr")
                }
                .font(.system(size: 20, weight: .medium, design: .rounded))
            }
            .padding(.top, 200)
        }
        .refreshable {
            VM.load()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
            .environmentObject(foodViewModel())
    }
}
