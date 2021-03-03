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
    
    let provider = MoyaProvider<MealApi>()
    
    func getMealData(category: String, completion: @escaping ([Meal])->()){
        provider.request(.category(category: category)){ result in
            switch result {
            case let .success(response):
                do {
                    let results = try JSONDecoder().decode(FoodCategory.self, from: response.data)
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
