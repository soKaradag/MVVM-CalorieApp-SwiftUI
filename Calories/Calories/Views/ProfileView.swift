//
//  ProfileVİew.swift
//  Calories
//
//  Created by Serdar Onur KARADAĞ on 12.11.2022.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var FVM = foodViewModel()
    
    var body: some View {
        VStack(alignment: .leading, spacing: 30){
            Text("TODAY'S TOTALS")
                .font(.system(size: 35, weight: .bold, design: .monospaced))
            VStack(alignment: .leading){
                Text("Calorie: \(Int(FVM.totalCalorieToday)) kcal")
                Text("Protein: \(Int(FVM.totalProteinToday)) gr")
                Text("Carb: \(Int(FVM.totalCarbToday)) gr")
            }
            .font(.system(size: 20, weight: .medium, design: .rounded))
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
