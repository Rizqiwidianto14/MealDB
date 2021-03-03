//
//  NetworkManager.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import Foundation
import Moya

protocol Network {
    associatedtype T: TargetType
    var provider: MoyaProvider<T> { get }
}


class NetworkManager: Network {
    
    let provider = MoyaProvider<EndPoint>()
    
    //MARK: Fetch Menu Data
    func getMealData(category: String, completion: @escaping ([Meal])->()){
        provider.request(.category(category: category)){ result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(FoodModel.self, from: response.data)
                    completion(results.meals)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
            
        }
    }
    
    // MARK: Fetch Recipe Data
    func getRecipeData(id: String, completion: @escaping ([Recipe])->()){
        provider.request(.recipeInfo(id: id)){ result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(RecipeModel.self, from: response.data)
                    completion(results.meals)
                } catch let err {
                    print(err)
                }
            case let .failure(error):
                print(error)
            }
            
        }
    }
    
    
    
    
}
