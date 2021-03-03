//
//  HomeCell.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import UIKit

class HomeCell: UICollectionViewCell {
    @IBOutlet weak var mealImage: UIImageView!
    @IBOutlet weak var mealLabel: UILabel!
    
    var homeViewModel: HomeViewModel! {
        didSet {
            mealLabel.text = homeViewModel.strMeal
            let urlString = URL(string: homeViewModel.strMealThumb)
            DispatchQueue.global().async { [weak self] in
                if let data = try? Data(contentsOf: urlString!) {
                    if let image = UIImage(data: data) {
                        DispatchQueue.main.async {
                            self!.mealImage.image = image
                        }
                    }
                }
            }
        }
    }
}
