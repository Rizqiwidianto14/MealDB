//
//  RecipeModel.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import Foundation

struct RecipeModel: Decodable {
    let meals:[Recipe]
}

struct Recipe: Decodable {
    let strMeal: String
    let strCategory: String
    let strInstructions: String
    let strMealThumb: String
    let idMeal: String
}
