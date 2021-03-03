//
//  Network.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import Foundation
import Moya

enum EndPoint {
    case category(category:String)
    case recipeInfo(id: String)
}

extension EndPoint: TargetType {
    var baseURL: URL {
        guard let url = URL(string: "https://www.themealdb.com/api/json/v1/1/") else { fatalError("baseURL could not be configured.")}
        return url
    }
    
    var path: String {
        switch self {
        case .category:
            return "filter.php"
        case .recipeInfo:
            return "lookup.php"
        }

    }
    
    var method: Moya.Method {
        return Moya.Method.get
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task {
        switch self {
        case .category(let category):
            return .requestParameters(parameters: ["c":category], encoding: URLEncoding.queryString)
        case .recipeInfo(let id):
            return .requestParameters(parameters: ["i" : id], encoding: URLEncoding.queryString)
        }
        
    }
    
    var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
    
}
