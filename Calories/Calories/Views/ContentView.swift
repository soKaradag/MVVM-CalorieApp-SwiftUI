//
//  ContentView.swift
//  Calories
//
//  Created by Serdar Onur KARADAĞ on 10.11.2022.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var VM: foodViewModel
    
    @State private var name = ""
    @State private var calorie = 0.00
    @State private var protein = 0.00
    @State private var carb = 0.00
    @State private var date = ""
    
    var body: some View {
        NavigationView{
            ScrollView{
                
                VStack(alignment: .leading, spacing: 20){
                    //Mark: Title
                    Text("HOME")
                        .font(.system(size: 35, weight: .bold, design: .monospaced))
                    
                    VStack {
                            HStack {
                                Text("Food Name:")
                                TextField("Type...", text: $name)
                            }
                            .padding()
                            VStack(alignment: .leading) {
                                Text("Calorie: \(Int(calorie)) kcal")
                                Slider(value: $calorie, in: 0...2000, step: 10)
                            }
                            .padding()
                            VStack(alignment: .leading) {
                                Text("Protein: \(Int(protein)) gr")
                                Slider(value: $protein, in: 0...200, step: 5)
                            }
                            .padding()
                            VStack(alignment: .leading) {
                                Text("Carb: \(Int(carb)) gr")
                                Slider(value: $carb, in: 0...200, step: 5)
                            }
                            .padding()
                            Button("ADD FOOD", action: {
                                addFood()
                                VM.save()
                                name = ""
                                calorie = 0.00
                                protein = 0.00
                                carb = 0.00
                                
                            })
                            .padding()
                    }
                    
                    VStack{
                        HStack {
                            //Mark: Header Title
                            Text("Recent Foods")
                                .bold()
                            Spacer()
                            //Mark: Header Link
                            NavigationLink {
                                RecentFoodView()
                            } label: {
                                HStack(spacing: 4) {
                                    Text("See All")
                                    Image(systemName: "chevron.right")
                                }
                            }
                        }
                        .padding(.top)
                        
                        ForEach(VM.foodList.prefix(6)) { Food in
                            
                            HStack{
                                VStack(alignment: .leading) {
                                    Text(Food.name)
                                    Text("Calorie: \(Int(Food.calorie))")
                                    Text("Protein: \(Int(Food.protein))")
                                    Text("Carb: \(Int(Food.carb))")
                                }
                                Spacer()
                                VStack(alignment: .leading) {
                                    Text("Date:")
                                    Text("\(Food.date, format: .dateTime.day().month().year())")
                                }

                            }
                            .padding()
                            
                        }
                    }
                    
                }
                .padding()
                .frame(maxWidth: .infinity)
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem {
                    NavigationLink {
                        ProfileView()
                    } label: {
                        Image(systemName: "person")
                            .font(.system(size: 23, weight: .bold))
                    }

                }
            }

        }
        .navigationViewStyle(.stack)
        .accentColor(.primary)
    }
    
    
    func addFood() {
        VM.foodList.append(Food(name: name, calorie: Float(calorie), protein: Float(protein), carb: Float(carb)))
        VM.foodList.sort{ $0.date > $1.date }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(foodViewModel())
    }
}
