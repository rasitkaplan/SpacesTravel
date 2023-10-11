//
//  HomeTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import UIKit
import Kingfisher

class HomeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabell: UILabel!
    @IBOutlet weak var imageeView: UIImageView!
    @IBOutlet weak var summaryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func setCell(newhome: Resultt) {
        titleLabell.text = newhome.title
        if let publishedDate = Date.formattedDate(from: newhome.publishedAt ?? "" ) {
            let pastTime = publishedDate.getPastTime()
            summaryLabel.text = pastTime
        }
        imageeView.kf.setImage(with: newhome.imageURL?.asURL)
    }
}
