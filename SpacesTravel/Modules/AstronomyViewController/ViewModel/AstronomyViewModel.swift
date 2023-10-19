//
//  AstronomyViewModel.swift
//  SpacesTravel
//
//  Created by rasit on 13.10.2023.
//

import Foundation
import Alamofire

// MARK: - Protocols

protocol AstronomyModelResponseProtocol: AnyObject {
    func astronomyModelSuccess(astronomyModel: [AstronomoModel])
    func astronomyModelFail(error: String)
}

class AstronomyModelViewModel {
    
    // MARK: - Variables
    
    private let networkManager = NetworkManager.shared
    weak var delegate: AstronomyModelResponseProtocol?
    
    // MARK: - FetchAstronomoModel
    
    func FetchAstronomoModel() {
        networkManager.request(router: .astronomyPictureOfTheDay) { [weak self] (result: Result<[AstronomoModel], AFError>) in
            switch result {
            case .success(let astronomyModel):
                self?.delegate?.astronomyModelSuccess(astronomyModel: astronomyModel)
            case .failure(let error):
                self?.delegate?.astronomyModelFail(error: error.localizedDescription)
            }
        }
    }
}
