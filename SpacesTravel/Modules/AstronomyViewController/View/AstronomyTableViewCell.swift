//
//  AstronomyTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 13.10.2023.
//

import UIKit
import Kingfisher

class AstronomyTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet fileprivate weak var astronomyImageView: UIImageView!
    @IBOutlet fileprivate weak var copyRightLabel: UILabel!
    @IBOutlet fileprivate weak var dateLabel: UILabel!
    @IBOutlet fileprivate weak var explanationLabel: UILabel!
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }
    // MARK: - SetCell
    
    func setCell(astronomy : AstronomoModel) {
        copyRightLabel.text = astronomy.copyright
        dateLabel.text = astronomy.date
        explanationLabel.text = astronomy.explanation
        
        astronomyImageView.kf.indicatorType = .activity
        astronomyImageView.kf.indicator?.view.backgroundColor = .systemBackground
        astronomyImageView.kf.indicator?.view.layer.cornerRadius = 6
        astronomyImageView.kf.setImage(
            with: astronomy.hdurl?.asURL,
            placeholder: nil,
            options: [.transition(.fade(0.7))])
        astronomyImageView.kf.setImage(with: astronomy.hdurl?.asURL)
    }
}
