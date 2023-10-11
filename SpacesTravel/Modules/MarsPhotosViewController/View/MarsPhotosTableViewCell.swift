//
//  MarsPhotosTableViewCell.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import UIKit

class MarsPhotosTableViewCell: UITableViewCell {

    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var secandLabel: UILabel!
    @IBOutlet weak var anamLabel: UILabel!
    @IBOutlet weak var babamIcinLabel: UILabel!
    @IBOutlet weak var marsImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setCell(photoModel: LatestPhoto) {
        marsImageView.kf.setImage(with: photoModel.imgSrc?.asURL)
        firstLabel.text = String("SOL : \(photoModel.sol ?? 0)")
        secandLabel.text = "ROVER : \(photoModel.rover?.name ?? "")"
        babamIcinLabel.text = "ID : \(photoModel.id ?? 0)"
        anamLabel.text = "Status : \(photoModel.rover?.status ?? "")"
    }
}
