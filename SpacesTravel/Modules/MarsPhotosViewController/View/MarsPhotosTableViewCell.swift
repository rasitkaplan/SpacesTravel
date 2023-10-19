//
//  MarsPhotosTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import UIKit

class MarsPhotosTableViewCell: UITableViewCell {

    // MARK: - Outlets
    
    @IBOutlet fileprivate weak var firstLabel: UILabel!
    @IBOutlet fileprivate weak var secandLabel: UILabel!
    @IBOutlet fileprivate weak var anamLabel: UILabel!
    @IBOutlet fileprivate weak var babamIcinLabel: UILabel!
    @IBOutlet fileprivate weak var marsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - SetCell
    
    func setCell(photoModel: LatestPhoto) {
        marsImageView.kf.setImage(with: photoModel.imgSrc?.asURL)
        firstLabel.text = String("SOL : \(photoModel.sol ?? 0)")
        secandLabel.text = "ROVER : \(photoModel.rover?.name ?? "")"
        babamIcinLabel.text = "ID : \(photoModel.id ?? 0)"
        anamLabel.text = "Status : \(photoModel.rover?.status ?? "")"
    }
}
