//
//  RecipeViewController.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import UIKit


class RecipeViewController: UIViewController {
    var networkProvider = NetworkManager()
    var recipeId = ""
    
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeInstruction: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
    }
    
    //MARK: Fetch Data From Meal DB Api and Fetch URL to Image
    fileprivate func fetchData() {
        networkProvider.getRecipeData(id: recipeId) { [self] recipe in
            self.recipeInstruction.text = recipe[0].strInstructions
            self.recipeTitle.text = recipe[0].strMeal
            let urlString = URL(string: recipe[0].strMealThumb)
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: urlString!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self!.recipeImage.image = image
                        }
                    }
                }
            }
            
        }
    }
    
}
