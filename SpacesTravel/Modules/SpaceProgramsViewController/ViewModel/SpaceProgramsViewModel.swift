//
//  SpaceProgramsViewModel.swift
//  SpacesTravel
//
//  Created by rasit on 16.10.2023.
//

import Foundation
import Alamofire

// MARK: - Protocols

protocol SpaceProgramsResponseProtocol: AnyObject {
    func programSuccess(programm: [SpacePrograms])
    func programFail(error: String)
}

class SpaceProgramsViewModel {
    
    // MARK: - Variables

    private let networkManager = NetworkManager.shared
    weak var delegate: SpaceProgramsResponseProtocol?
    
    // MARK: - FetchSpacePrograms

    func fetchSpacePrograms() {
        networkManager.request(router: .spaceprograms) { [weak self] (result: Result<SpaceProgramsModel, AFError>) in
            switch result {
            case .success(let program):
                self?.delegate?.programSuccess(programm: program.results)

            case .failure(let error):
                self?.delegate?.programFail(error: error.localizedDescription)
            }
        }
    }
}
