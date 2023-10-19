//
//  AstronomyViewController + TableView.swift
//  SpacesTravel
//
//  Created by rasit on 13.10.2023.
//

import Foundation
import UIKit

// MARK: - TableView View Functions

extension AstronomyViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        astronomyModel?.count ?? 0
}

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: AstronomyTableViewCell.nameOfClass, for: indexPath) as? AstronomyTableViewCell {
            cell.setCell(astronomy: (astronomyModel?[indexPath.row])!)
            return cell
        }
        return UITableViewCell()
    }
}

