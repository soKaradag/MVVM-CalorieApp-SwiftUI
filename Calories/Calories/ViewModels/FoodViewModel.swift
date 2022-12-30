//
//  FoodViewModel.swift
//  Calories
//
//  Created by Serdar Onur KARADAĞ on 7.12.2022.
//

import Foundation

class foodViewModel:ObservableObject {
    @Published var foodList = [Food] ()
    @Published var totalCalorieToday = 0.00
    @Published var totalProteinToday = 0.00
    @Published var totalCarbToday = 0.00
    
    init() {
        load()
    }
    
    func load() {

        guard let data = UserDefaults.standard.data(forKey: "foodList"),
              let savedFoods = try? JSONDecoder().decode([Food].self, from: data) else { foodList = []; return }

        foodList = savedFoods.sorted{ $1.date < $0.date }
        calculateCalorie()
        calculateProtein()
        calculateCarb()
        
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(foodList)
            UserDefaults.standard.set(data, forKey: "foodList")
 
        } catch {
            print(error)
        }
    }
    
    func calculateCalorie() {
        let todayCalories = foodList.filter({ Calendar.current.isDateInToday($0.date) })
        totalCalorieToday = Double(todayCalories.map(\.calorie).reduce(0, +))
    }
    
    func calculateProtein() {
        let todayProtein = foodList.filter({ Calendar.current.isDateInToday($0.date) })
        totalProteinToday = Double(todayProtein.map(\.protein).reduce(0, +))
    }
    
    func calculateCarb() {
        let todayCarb = foodList.filter({ Calendar.current.isDateInToday($0.date) })
        totalCarbToday = Double(todayCarb.map(\.carb).reduce(0, +))
    }
    

}
