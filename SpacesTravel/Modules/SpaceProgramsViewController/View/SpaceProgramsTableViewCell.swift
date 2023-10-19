//
//  SpaceProgramsTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 16.10.2023.
//

import UIKit
import Kingfisher

class SpaceProgramsTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    @IBOutlet fileprivate weak var spaceImageView: UIImageView!
    @IBOutlet fileprivate weak var titleLabel: UILabel!
    @IBOutlet fileprivate weak var startDateLabel: UILabel!
    @IBOutlet fileprivate weak var endDateLabel: UILabel!
    @IBOutlet fileprivate weak var descLabel: UILabel!
    
    var countdownDate: Date?
    weak var timer: Timer?
    
    // MARK: - Lifecycle

        override func prepareForReuse() {
            super.prepareForReuse()
    }
    
    // MARK: - SetCell
    
    func setCell(spaceprogram: SpacePrograms) {
        titleLabel.text = spaceprogram.name
        descLabel.text = spaceprogram.description
        spaceImageView.kf.setImage(with: (spaceprogram.imageURL?.asURL))
        startDateLabel.text = "Start Date : \(Date.formattedDateFromString(dateString: spaceprogram.startDate ?? "") ?? "")"
        if let endDateData = Date.formattedDateFromString(dateString: spaceprogram.endDate ?? "") {
            endDateLabel.text = "End Date : \(endDateData)"
        }else {
            let defauldeEndDateData = "End Date : The program continues "
            endDateLabel.text = defauldeEndDateData
        }
    }
}
