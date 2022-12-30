//
//  RecentFoodView.swift
//  Calories
//
//  Created by Serdar Onur KARADAĞ on 7.12.2022.
//

import SwiftUI

struct RecentFoodView: View {
    
    @EnvironmentObject var VM: foodViewModel
    @State private var editName = ""
    @State private var editCalorie: Float = 0.00
    @State private var editCarb: Float = 0.00
    @State private var editProtein: Float = 0.00
    @State private var isActive = false
    
    var body: some View {
        List {
            ForEach($VM.foodList) { $Food in
                HStack{
                    VStack(alignment: .leading) {
                        Text(Food.name)
                        Text("Calorie: \(Int(Food.calorie)) kcal")
                        Text("Protein: \(Int(Food.protein)) gr")
                        Text("Carb: \(Int(Food.carb)) gr")
                    }
                        Spacer()
                    VStack(alignment: .leading) {
                            Text("Date:")
                            Text("\(Food.date, format: .dateTime.day().month().year())")
                    }
                }
                .padding()
            }
            .onDelete(perform: delete)
        }
        .listStyle(.plain)
        .navigationTitle("Foods")
            .toolbar{
                EditButton()
        }
    }
    
    func delete(at offsets: IndexSet) {
        VM.foodList.remove(atOffsets: offsets)
        VM.save()
    }
    
}

struct RecentFoodView_Previews: PreviewProvider {
    static var previews: some View {
        RecentFoodView()
            .environmentObject(foodViewModel())
    }
}
