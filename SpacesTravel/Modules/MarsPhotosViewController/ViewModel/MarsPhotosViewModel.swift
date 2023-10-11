//
//  MarsPhotosViewModel.swift
//  SpacesTravel
//
//  Created by rasit on 2.10.2023.
//

import Foundation
import Alamofire


protocol MarsPhotosProtocol: AnyObject {
    func marsphotosSuccess(latestPhoto: [LatestPhoto])
    func marsphotosFail(error: String)
}

class MarsPhotosViewModel {
    
    private let networkManager = NetworkManager.shared
    weak var delegate: MarsPhotosProtocol?
    
    func FetchMarsPhoto() {
        networkManager.request(router: .marsPhotos) { [weak self] (result: Result<MarsPhotos, AFError>) in
            switch result {
            case .success(let latestPhoto):
                self?.delegate?.marsphotosSuccess(latestPhoto: latestPhoto.latestPhotos)

            case .failure(let error):
                self?.delegate?.marsphotosFail(error: error.localizedDescription)
            }
        }
    }
}
