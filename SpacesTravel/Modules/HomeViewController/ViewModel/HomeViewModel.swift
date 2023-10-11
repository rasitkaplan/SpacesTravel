//
//  HomeViewModel.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation
import Alamofire

// MARK: - ApodResponseProtocol

protocol HomeListProtocol: AnyObject {
    func newsSuccess(news: [Resultt])
}


class HomeViewModel {
    
    // MARK: - Variables
    
    private let networkManager = NetworkManager.shared
    weak var delegate: HomeListProtocol?
    
    // MARK: - Fetch Apod
    
    func fetchNewsHome() {
        networkManager.request(router: .spaceNews) { [weak self] (result: Result<HomeModel, AFError>) in
            switch result {
            case .success(let homemodel):
                self?.delegate?.newsSuccess(news: homemodel.results!)
            case .failure(_): break
            }
        }
    }
}

