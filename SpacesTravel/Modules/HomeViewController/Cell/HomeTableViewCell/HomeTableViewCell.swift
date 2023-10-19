//
//  HomeTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet fileprivate weak var titleLabell: UILabel!
    @IBOutlet fileprivate weak var imageeView: UIImageView!
    @IBOutlet fileprivate weak var summaryLabel: UILabel!
    
    // MARK: - Lifecycle
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    // MARK: - SetCell
    
    func setCell(newhome: Resultt) {
        titleLabell.text = newhome.title
        if let publishedDate = Date.formattedDate(from: newhome.publishedAt ?? "" ) {
            let pastTime = publishedDate.getPastTime()
            summaryLabel.text = pastTime
        }
        imageeView.kf.setImage(with: newhome.imageURL?.asURL)
    }
}
