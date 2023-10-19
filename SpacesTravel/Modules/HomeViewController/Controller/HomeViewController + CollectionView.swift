//
//  HomeViewController + CollectionView.swift
//  SpacesTravel
//
//  Created by rasit on 28.09.2023.
//

import Foundation
import UIKit

// MARK: - Collection View Functions

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return titleModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "HomeCollectionViewCell", for: indexPath) as! HomeCollectionViewCell
        cell.setCell(title: titleModel[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        switch indexPath.row {
          case 0:
            // Launches
            let mainLaunchesViewController = LounchViewController()
            self.navigationController?.pushViewController(mainLaunchesViewController, animated: true)
        case 1:
          // Events
            let mainEventsViewController = EventViewController()
            self.navigationController?.pushViewController(mainEventsViewController, animated: true)
        case 2:
            // MarsPhotos
            let mainMarsPhotosViewController = MarsPhotosViewController()
            self.navigationController?.pushViewController(mainMarsPhotosViewController, animated: true)
        case 3:
            // AstronomyPictureOfTheDays
            let mainAstronomyViewController = AstronomyViewController()
            self.navigationController?.pushViewController(mainAstronomyViewController, animated: true)
        case 4:
            // SpacePrograms
            let mainAstronomyViewController = SpaceProgramsViewController()
            self.navigationController?.pushViewController(mainAstronomyViewController, animated: true)
          default:
              break
        }
    }
}
