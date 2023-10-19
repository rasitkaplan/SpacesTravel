//
//  SpaceProgramsViewController + TableView.swift
//  SpacesTravel
//
//  Created by rasit on 16.10.2023.
//

import Foundation
import UIKit

// MARK: - TableView View Functions

extension SpaceProgramsViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        spacePrograms?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: SpaceProgramsTableViewCell.nameOfClass, for: indexPath) as? SpaceProgramsTableViewCell {
                cell.setCell(spaceprogram: (spacePrograms?[indexPath.row])!)
                return cell
        }
            return UITableViewCell()
    }
}
