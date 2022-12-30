//
//  FoodModel.swift
//  Calories
//
//  Created by Serdar Onur KARADAĞ on 10.11.2022.
//

import Foundation




struct Food: Identifiable, Codable {
    var id = UUID()
    var name: String
    var calorie: Float
    var protein: Float
    var carb: Float
    var date = Date()
}


