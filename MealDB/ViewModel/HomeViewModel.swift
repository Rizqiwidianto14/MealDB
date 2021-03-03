//
//  HomeViewModel.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import Foundation
import Moya

struct HomeViewModel{
    let strMeal: String
    let idMeal: String
    let strMealThumb: String
    
    init(meal: Meal) {
        self.strMeal = meal.strMeal
        self.idMeal = meal.idMeal
        self.strMealThumb = meal.strMealThumb
    }
    
}
