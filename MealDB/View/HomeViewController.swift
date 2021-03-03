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
        // Do any additional setup after loading the view.
        fetchData()
        
    }
    
    fileprivate func fetchData() {
        networkProvider.getMealData(category: "Seafood") { meal in
            print(meal[0].strMeal)
            self.homeViewModels = meal.map({return HomeViewModel(meal: $0)}) ?? []
            self.homeCollectionView.reloadData()
        }
        
    }
    
    
}


extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return homeViewModels.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCell", for: indexPath) as! HomeCell
        let homeViewModel = homeViewModels[indexPath.row]
        cell.homeViewModel  = homeViewModel
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let padding: CGFloat = 25
        let collectionCellSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionCellSize/2, height: 250)
        
    }
    
    
    
    
    
    
}

