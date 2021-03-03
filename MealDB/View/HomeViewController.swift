//
//  ViewController.swift
//  MealDB
//
//  Created by Rizqi Imam Gilang Widianto on 03/03/21.
//

import UIKit
import Moya

class HomeViewController: UIViewController {
    @IBOutlet weak var homeCollectionView: UICollectionView!
    var homeViewModels = [HomeViewModel]()
    var networkProvider = NetworkManager()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchData()
        
    }
    
    //MARK: Fetch Data
    fileprivate func fetchData() {
        networkProvider.getMealData(category: "Seafood") { meal in
            print(meal[0].strMeal)
            self.homeViewModels = meal.map({return HomeViewModel(meal: $0)})
            self.homeCollectionView.reloadData()
        }
        
    }
    
    
}

// MARK: - Collection View Set Up
extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModels.count
    }
    
    //MARK: Inject Data to Collection View
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let homeViewModel = homeViewModels[indexPath.row]
        cell.homeViewModel  = homeViewModel
        
        return cell
    }
    
    //MARK: Setting Up Collection View Layout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 25
        let collectionCellSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionCellSize/2, height: 250)
        
    }
    
    //MARK: Open Recipe View Controller and Send Id Data
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let homeViewModel = homeViewModels[indexPath.row]
        let storyBoard : UIStoryboard = UIStoryboard(name: "Main", bundle:nil)
        let resultViewController = storyBoard.instantiateViewController(withIdentifier: "RecipeViewController") as! RecipeViewController
        resultViewController.recipeId = homeViewModel.idMeal
        self.navigationController?.pushViewController(resultViewController, animated: true)
    }
    
}

