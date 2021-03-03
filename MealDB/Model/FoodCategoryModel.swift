//
//  AllMealModel.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import Foundation

struct FoodModel: Decodable {
    let meals:[Meal]
}


struct Meal: Decodable {
    let strMeal: String
    let strMealThumb: String
    let idMeal: String
}

