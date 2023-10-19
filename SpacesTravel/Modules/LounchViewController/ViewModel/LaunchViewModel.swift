//
//  LouchViewModel.swift
//  SpacesTravel
//
//  Created by rasit on 28.09.2023.
//

import Foundation
import Alamofire

    // MARK: - Protocols

protocol LaunchProtocol: AnyObject {
    func launchSuccess(launch: [Launchh])
}

class LaunchViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    weak var delegate: LaunchProtocol?

    // MARK: - Fetch Upcoming

    func fetchUpcoming() {
        networkManager.request(router: .launches) { [weak self] (result: Result<LaunchModel, AFError>) in
            switch result {
            case .success(let launch):
                self?.delegate?.launchSuccess(launch: launch.results)
            case .failure(_): break
            }
        }
    }
}
