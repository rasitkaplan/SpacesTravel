//
//  SpaceProgramsModel.swift
//  SpacesTravel
//
//  Created by rasit on 16.10.2023.
//

import Foundation

struct SpaceProgramsModel: Codable {
    let count: Int?
    let results: [SpacePrograms]
}

// MARK: - Result
struct SpacePrograms: Codable {
    let id: Int?
    let name, description: String?
    let imageURL: String?
    let startDate: String?
    let endDate: String?
    let infoURL: String?
    let wikiURL: String?

    enum CodingKeys: String, CodingKey {
        case id, name, description
        case imageURL = "image_url"
        case startDate = "start_date"
        case endDate = "end_date"
        case infoURL = "info_url"
        case wikiURL = "wiki_url"
    }
}
