//
//  MarsPhotosViewController + TableView.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import Foundation
import UIKit

// MARK: - UITableViewDelegate

extension MarsPhotosViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return marsPhotoModel?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: MarsPhotosTableViewCell.nameOfClass, for: indexPath) as? MarsPhotosTableViewCell {
            cell.setCell(photoModel: (marsPhotoModel?[indexPath.row])!)
            return cell
        }
        return UITableViewCell()
    }
}
