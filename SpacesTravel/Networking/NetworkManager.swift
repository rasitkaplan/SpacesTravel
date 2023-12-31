//
//  NetworkManager.swift
//  SpacesTravel
//
//  Created by rasit on 27.09.2023.
//

import Foundation
import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()
    private init() {}
    
    func request<T: Decodable>(router: Router, completion: @escaping (Result<T, AFError>) -> Void) {
        var url = router.rawValue
        
        if router.requiresApiKey {
            url += "?api_key=\(apiKey)"
        }
        
        AF.request(url).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                completion(.success(data))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
