//
//  HomeViewController + TableView.swift
//  SpacesTravel
//
//  Created by rasit on 28.09.2023.
//

import Foundation
import UIKit

// MARK: - TableView View Functions

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return home?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: HomeTableViewCell.nameOfClass, for: indexPath) as? HomeTableViewCell {
            cell.setCell(newhome: (home?[indexPath.row])!)
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedData = home?[indexPath.row]
        let urlString = selectedData?.url
        if let url = URL(string: urlString ?? "") {
            UIApplication.shared.open(url)
        }
    }
}
