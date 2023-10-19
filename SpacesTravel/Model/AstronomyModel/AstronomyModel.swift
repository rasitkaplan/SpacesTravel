//
//  AstronomyModel.swift
//  SpacesTravel
//
//  Created by rasit on 13.10.2023.
//

import Foundation

struct AstronomoModel: Codable {
    let copyright, date, explanation: String?
    let hdurl: String?
    let mediaType: MediaType?
    let serviceVersion: ServiceVersion?
    let title: String?
    let url: String?

    enum CodingKeys: String, CodingKey {
        case copyright, date, explanation, hdurl
        case mediaType = "media_type"
        case serviceVersion = "service_version"
        case title, url
    }
}

enum MediaType: String, Codable {
    case image = "image"
    case video = "video"
}

enum ServiceVersion: String, Codable {
    case v1 = "v1"
}
