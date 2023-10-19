//
//  LounchViewController + TableView.swift
//  SpacesTravel
//
//  Created by rasit on 19.10.2023.
//

import Foundation
import UIKit

// MARK: - TableView Functions

extension LounchViewController: UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return launch?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: LaunchTableViewCell.nameOfClass, for: indexPath) as? LaunchTableViewCell {
            cell.setCell(launch: (launch?[indexPath.row])!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = LounchViewController()
        vc.launch = launch
    }
}
