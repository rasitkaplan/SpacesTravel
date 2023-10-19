//
//  EventViewController + TableView.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import Foundation
import UIKit

// MARK: - TableView View Functions

extension EventViewController : UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return event?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.nameOfClass, for: indexPath) as? EventTableViewCell {
            cell.setCell(event: (event?[indexPath.row])!)
            return cell
        }
        return UITableViewCell()
    }
}
