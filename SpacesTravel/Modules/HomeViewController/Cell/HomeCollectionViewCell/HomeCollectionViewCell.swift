//
//  HomeCollectionViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import UIKit
import Kingfisher

class HomeCollectionViewCell: UICollectionViewCell {
    @IBOutlet fileprivate weak var nameLabel: UILabel!
    @IBOutlet fileprivate weak var imageView: UIImageView!
    
    // MARK: - SetCell
    
    func setCell(title: TitleModel) {
        imageView.kf.setImage(with: title.image?.asURL)
        nameLabel.text = title.name
    }
}
